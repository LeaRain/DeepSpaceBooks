// Required modules are set to const -> They won't be change in the process, they are some kind of static, so change to constant
const express = require("express");
const pg = require("pg");
const bodyParser = require("body-parser");
const session = require("express-session");

// Encryption library for hashing passwords
const bcrypt = require("bcrypt");
const saltRounds = 10;

// Instead of using a connection string, for local use and development, there is a simple connection with my own "server".
// Yes, there isn't a password and for local development, this is okay, I'm the only person with access to my database in my networks.
// TODO: Change to heroku and connection string (finally, at the end)
let dbClient = new pg.Client({
    host: "localhost",
    user: "weirdjs",
    database: "jsexercise"
});
dbClient.connect();

const urlencodedParser = bodyParser.urlencoded({
    extended: false
});

const PORT = 3000;

const app = express();

app.use(session({
    secret: "This is a secret!",
    // Cookie lasts 4.2 days, approximately
    cookie: { maxAge: 360000000 },
    resave: true,
    saveUninitialized: false
}));

app.set("views", "views");
app.set("view engine", "pug");

app.get("/", function (req, res) {
    res.render("index");
});

// Test function for checking the simple functioning of the registry button
app.get("/registration", function (req, res) {
    res.render("registration");
});

app.post("/registrationBtn", urlencodedParser, function (req, res) {
    let username = req.body.registrationUsername;
    let password = req.body.registrationPassword;
    let verifyPassword = req.body.registrationVerifyPassword;

    if (verifyPassword !== password){
        res.render("registration", {registrationError: "Your passwords are not the same."})
    }

    else if (verifyPassword === "" || password === ""){
        res.render("registration", {registrationError: "Your passwords are empty."})
    }
    else {
        const selectQuery = "SELECT * FROM user_data WHERE username=$1;";
        const userValue = [username];

        dbClient.query(selectQuery, userValue, function (dbError, dbResponse) {
            // If the 0th element of the array with the database query result contains an undefined
            if (dbResponse.rows[0] === undefined) {
                // Encrypting password for storing in database
                bcrypt.genSalt(saltRounds, function (err, salt) {
                    bcrypt.hash(password, salt, function (err, hash) {
                        const insertQuery = "INSERT INTO user_data (username, password_hash) VALUES ($1, $2);";
                        const insertValues = [username, hash];

                        dbClient.query(insertQuery, insertValues, function (dbError, dbResponse) {
                            if (!dbError) {
                                res.render("index", {successMessage:"Registration successful! You can login now."});
                            } else {
                                res.render("registration", {registrationError: "Oooppps! Something went wrong. Please try again."});
                            }
                        })
                    });
                });
            } else {
                res.render("registration", {registrationError: "It seems like the username " + username + " is already taken. Please try again with another name."})
            }
        });
    }
});

// Test function for checking the simple functioning of the post button
app.post("/loginBtn", urlencodedParser, function (req, res) {
    let username = req.body.loginUsername;
    let password = req.body.loginPassword;

    // Empty username and password aren't allowed
    if (username !== "" || password !==""){
        // Getting username and password_hash so the username can be used for a session variable
        const selectQuery = "SELECT username, password_hash FROM user_data where username=$1;";
        const userValue = [username];

        dbClient.query(selectQuery, userValue, function (dbError, dbResponse) {
            // If there isn't a database output, this if will be proceed and render an error with no such username
            if (dbResponse.rows == ""){
                res.render("index", {loginError: "No such username found."});
            }
            else {
                let databaseHash = dbResponse.rows[0].password_hash;
                // For checking if the password is right -> compare function because calculating the hash again will cause another hash result
                bcrypt.compare(password, databaseHash, function (err, hashRes) {
                    if (hashRes) {
                        console.log("Login success");
                        req.session.user = {
                            username: dbResponse.rows[0].username
                        };
                        res.redirect("home");
                    } else {
                        console.log("Login fail");
                        res.render("index", {loginError: "You've entered the wrong password."});
                    }
                });
            }
        });
    }

    else{
        res.render("index", {loginError: "Please enter username and password."});
    }

});

app.get("/home", urlencodedParser, function (req, res){
    if (req.session.user != undefined) {
        res.render("home", {acceptedUsername: req.session.user.username});
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."})
    }
});

app.get("/logout", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        res.render("logout");
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."})
    }
});

app.post("/logoutBtn", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        req.session.destroy(function (err) {
            console.log("Sessions destroyed successfully.");
        });
        res.render("index", {successMessage: "Logout successful!"});
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."})
    }

});

app.post("/stayInBtn", urlencodedParser, function (req, res) {
    res.redirect("home");
});

app.post("/keywordSearchBtn", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        let keyword = req.body.keywordInput;
        if (keyword != "") {
            const selectQuery = "SELECT book_id, title, author, coauthor from book_information where (title like $1 or author like $1 or coauthor like $1 or isbn like $1);";
            // Not only a perfect 1:1 match is a result, books alike are also in the resulting output
            const selectValues = ["%" + keyword + "%"];

            dbClient.query(selectQuery, selectValues, function (dbError, dbResponse) {
                if (!dbError){
                    if (dbResponse.rows != ""){
                        res.render("searchresult", {
                            bookTitles: dbResponse.rows,
                            acceptedUsername: req.session.user.username
                        })

                    }
                    else{
                        res.render("searchresult", {
                            noResults: "There aren't any results. Please try again.",
                            acceptedUsername: req.session.user.username
                        })
                    }
                }
                else{
                    res.render("home", {
                        searchError: "Something went wrong with the database connection. Please try again later.",
                        acceptedUsername: req.session.user.username
                    })
                }
            });
        } else {
            res.render("home", {
                searchError: "Please enter something to search.",
                acceptedUsername: req.session.user.username
            })
        }
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }
});

app.post("/detailSearchBtn", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        let bookTitle = req.body.detailTitle;
        let bookISBN = req.body.detailISBN;
        let bookAuthor = req.body.detailAuthor;

        if (bookTitle == "" || bookISBN == "" || bookAuthor == ""){
            res.render("home", {
                // If the % trick is used and the strings are empty, the database will check for %% which means literally all possibilities
                searchError: "Please enter something to search in every detail search field. If you have not all the information, try keyword search.",
                acceptedUsername: req.session.user.username
            });
        }

        else {
            const selectQuery = "SELECT book_id, title, author, coauthor from book_information where (title like $1 or (author like $2 or coauthor like $2) or isbn like $3);";
            const selectValues = ["%" + bookTitle + "%", "%" + bookAuthor + "%", "%" + bookISBN + "%"];

            dbClient.query(selectQuery, selectValues, function (dbError, dbResponse) {
                if (!dbError){
                    if (dbResponse.rows != ""){
                        res.render("searchresult", {
                            bookTitles: dbResponse.rows,
                            acceptedUsername: req.session.user.username
                        })

                    }
                    else{
                        res.render("searchresult", {
                            noResults: "There aren't any results. Please try again.",
                            acceptedUsername: req.session.user.username
                        })
                    }
                }

                else{
                    res.render("home", {
                        searchError: "Something went wrong with the database connection. Please try again later.",
                        acceptedUsername: req.session.user.username
                    })
                }
            })
        }
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }
});

app.get("/books", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        const selectQuery = "SELECT book_id, title, author, coauthor from book_information";

        dbClient.query(selectQuery, function (dbError, dbResponse){
            res.render("books", {
                bookList: dbResponse.rows,
                acceptedUsername: req.session.user.username
            })
        })
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }
});

app.get("/books/:book_id", function (req, res) {
    if (req.session.user != undefined) {
        const selectQuery = "SELECT title, author, coauthor, isbn, publish_year FROM book_information where book_id=$1";
        // The book_id is required -> getting out of request parameters
        const selectValue = [req.params.book_id];

        dbClient.query(selectQuery, selectValue, function (dbError, dbResponse) {
            if (!dbError){
                if (dbResponse.rows != ""){
                    res.render("bookinformation", {
                        // Information comes in a list, so the first element of this list is required
                        bookResult: dbResponse.rows[0],
                        acceptedUsername: req.session.user.username
                    })
                }
                else{
                    res.render("home", {
                        searchError: "No such book found. Please try something else..",
                        acceptedUsername: req.session.user.username
                    })
                }
            }
            else{
                res.render("home", {
                    searchError: "Something went wrong with the database connection. Please try again later.",
                    acceptedUsername: req.session.user.username
                })
            }
        })
    }


    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }

});



function initSession(session) {
    if (session.notes == undefined) {
        session.notes = [];
    }
}

app.listen(PORT, function () {
    console.log("Deep Space Books listening on Port ${PORT}");
});
