// Required modules are set to const -> They won't be change in the process, they are some kind of static, so change to constant
const express = require("express");
const pg = require("pg");
const bodyParser = require("body-parser");
const session = require("express-session");

// Encryption library for hashing passwords
const bcrypt = require("bcrypt");
const saltRounds = 10;

// COMMENT IN FOR LOCAL DATABASE WITH THESE SPECIFICATION (AND THE REST OUT)
// Instead of using a connection string, for local use and development, there is a simple connection with my own "server".
// Yes, there isn't a password and for local development, this is okay, I'm the only person with access to my database in my networks.
let dbClient = new pg.Client({
    host: "localhost",
    user: "postgres",
    database: "jsexercise"
});
/*
// COMMENT IN FOR DOCKER AND HEROKU (AND THE REST OUT)
let CON_STRING = process.env.DB_CON_STRING;
if (CON_STRING == undefined) {
    console.log("Error: Environment variable DB_CON_STRING not set!");
    process.exit(1);
}
// COMMENT IN FOR HEROKU (AND FOR THE REST OUT)
pg.defaults.ssl = true;

let dbClient = new pg.Client(CON_STRING);
*/
// For Docker, SSL can be ignored
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

    console.log(username, password);

    // Empty username and password aren't allowed
    if (username !== "" || password !==""){
        // Getting username and password_hash so the username can be used for a session variable
        const selectQuery = "SELECT user_id, username, password_hash FROM user_data where username=$1;";
        const userValue = [username];

	dbClient.query("SELECT 42;", function(dbError, dbResponse) {
		console.log(dbError, dbResponse);
	})

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
                        req.session.user = {
                            username: dbResponse.rows[0].username,
                            // userID is a primary key in database -> unique identifier
                            userID: dbResponse.rows[0].id
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
                        res.render("booksearchresult", {
                            bookTitles: dbResponse.rows,
                            acceptedUsername: req.session.user.username
                        })

                    }
                    else{
                        res.render("booksearchresult", {
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
                        res.render("booksearchresult", {
                            bookTitles: dbResponse.rows,
                            acceptedUsername: req.session.user.username
                        })

                    }
                    else{
                        res.render("booksearchresult", {
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

app.post("/authorSearchBtn", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        let authorName = req.body.authorInput;

        if (authorName != "") {
            const selectQuery = "SELECT author_id, author_name from author_information where author_name like $1";
            const selectValue = ["%" + authorName + "%"];

            dbClient.query(selectQuery, selectValue, function (dbError, dbResponse) {
                if (!dbError){
                    if (dbResponse.rows != ""){
                        res.render("authorsearchresult", {
                            authorList: dbResponse.rows,
                            acceptedUsername: req.session.user.username
                        })

                    }
                    else{
                        res.render("authorsearchresult", {
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

        else{
            res.render("home", {
                searchError: "Please enter something to search in the author search field. If you are looking for books, not authors, try the book search.",
                acceptedUsername: req.session.user.username
            });
        }

    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }
});

app.get("/books", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        const selectQuery = "SELECT book_id, title, author, coauthor from book_information";

        // Here isn't a checkup for failing connection, empty dbResponse or something like that because that would indicate a big problem with the database (connection) -> fails at enough other points
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
        const selectQuery = "SELECT book_id, title, author, author_id, coauthor, isbn, publish_year  FROM book_information JOIN author_information ON book_information.author = author_information.author_name WHERE book_information.book_id=$1;";
        // The book_id is required -> getting out of request parameters
        const selectValue = [req.params.book_id];

        dbClient.query(selectQuery, selectValue, function (dbError, dbResponse) {
            if (!dbError){
                if (dbResponse.rows != ""){
                    // Getting all information out of review_information and even more from other tables, ORDER BY for a useful order (latest review first)
                    const followingQuery = "SELECT review_information.*, user_data.username, book_information.title FROM review_information NATURAL JOIN user_data NATURAL JOIN book_information WHERE book_information.book_id=$1 ORDER BY review_date DESC, review_time DESC;";

                    // It's easy to stick those queries together, no check for followErr because this would have also triggered dbError
                    dbClient.query(followingQuery, selectValue, function (followErr, followResponse) {
                        if (followResponse.rows != ""){
                            res.render("bookinformation", {
                                bookResult: dbResponse.rows[0],
                                acceptedUsername: req.session.user.username,
                                reviewResults: followResponse.rows,
                                totalReviews: followResponse.rows.length
                            })
                        }
                        else{
                            res.render("bookinformation", {
                                bookResult: dbResponse.rows[0],
                                acceptedUsername: req.session.user.username,
                                noResults: "Sorry, there aren't any reviews. Maybe you should start with one?"
                            })
                        }

                    })

                }
                else{
                    res.render("home", {
                        searchError: "No such book found. Please try something else.",
                        acceptedUsername: req.session.user.username
                    })
                }
            }
            else{
                console.log(dbError);
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


app.get("/authors", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        const selectQuery = "SELECT author_name, author_id from author_information;";

        dbClient.query(selectQuery, function (dbError, dbResponse) {
            res.render("authors", {
                authorList: dbResponse.rows,
                acceptedUsername: req.session.user.username
            })
        })
    }

    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }

});


app.get("/authors/:author_id", function (req, res) {
    if (req.session.user != undefined) {
        // Getting information about an author and books with a join statement
        const selectQuery = "SELECT book_id, title, author_name FROM book_information JOIN author_information ON book_information.author = author_information.author_name WHERE author_information.author_id=$1;";
        const selectValue = [req.params.author_id];

        dbClient.query(selectQuery, selectValue, function (dbError, dbResponse) {
            if(!dbError){
                if (dbResponse.rows != ""){
                    res.render("authorinformation", {
                        firstResult: dbResponse.rows[0],
                        authorResult: dbResponse.rows,
                        acceptedUsername: req.session.user.username
                    })
                }
                else{
                    res.render("home", {
                        searchError: "No such author found. Please try something else.",
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

// Posting the result for a specific book_id -> identifier for database (insert query and value input)
app.post("/books/saveReview/:book_id", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        const userSelectQuery = "SELECT user_id, username FROM user_data WHERE username=$1";
        const userSelectValue = [req.session.user.username];

        dbClient.query(userSelectQuery, userSelectValue, function (dbError, dbResponse) {
            if (!dbError){
                let reviewSelect = req.body.reviewSelect;
                let reviewText = req.body.reviewText;
                let book_id = req.params.book_id;
                let user_id = dbResponse.rows[0].user_id;

                const selectQuery = "SELECT book_id, user_id FROM review_information WHERE book_id=$1 and user_id=$2";
                const selectValues = [book_id, user_id];

                dbClient.query(selectQuery, selectValues, function (dbError, dbResponse) {
                    // Database may be check for unique book_id and user_id but there could still an other database error arrive
                    if (dbResponse.rows != ""){
                        res.render("error", {
                                searchError: "You are allowed to post one review per book, not more.",
                                }
                            )
                    }

                    else{
                        // Insert all the information about the book -> Current date and current time are database functions
                        const insertQuery = "INSERT INTO review_information (book_id, user_id, score, review_date, review_time, review_text) values ($1, $2, $3, CURRENT_DATE, CURRENT_TIME, $4);";
                        const insertValues = [book_id, user_id, reviewSelect, reviewText];

                        dbClient.query(insertQuery, insertValues, function (insertError, insertResponse) {
                            res.render("success", {
                                    acceptedUsername: req.session.user.username,
                                    success: "This review was successful. Thank you"
                                }
                            )
                        })
                    }
                });
            }
            else{
                res.render("home", {
                    searchError: "Something went wrong with the database connection. Please try again later.",
                    acceptedUsername: req.session.user.username
                })
            }
        });
    }

    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }
});

app.post("/getCurrentFeed", function (req, res) {
    res.redirect("reviewfeed");
});

app.get("/reviewfeed", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        // Get the latest 100 reviews, shouldn't throw an error
        const selectQuery = "SELECT review_information.*, user_data.username, book_information.*, author_information.author_id FROM review_information NATURAL INNER JOIN user_data JOIN book_information ON book_information.book_id = review_information.book_id JOIN author_information ON author_information.author_name = book_information.author ORDER BY review_date DESC, review_time DESC LIMIT 100;";
        dbClient.query(selectQuery, function (dbError, dbResponse) {
            res.render("reviewfeed", {
                acceptedUsername: req.session.user.username,
                reviewResults: dbResponse.rows
                });
        });
    }
    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }

});

app.get("/profile", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        res.render("profile", {
            acceptedUsername: req.session.user.username
        });
    }

    else{
        res.render("index", {sessionError: "You need to be logged in for this."});
    }
});

app.post("/changePassword", urlencodedParser, function (req, res) {
    if (req.session.user != undefined) {
        let oldPassword = req.body.oldPassword;
        let newPassword = req.body.password;
        let verifyPassword = req.body.verifyPassword;

        if (oldPassword != "" || newPassword != "" || verifyPassword != "") {

            if (newPassword == verifyPassword) {

                const selectQuery = "SELECT password_hash FROM user_data WHERE username=$1";
                const selectValue = [req.session.user.username];

                dbClient.query(selectQuery, selectValue, function (dbError, dbResponse) {
                    if (!dbError) {
                        let databaseHash = dbResponse.rows[0].password_hash;
                        bcrypt.compare(oldPassword, databaseHash, function (err, hashRes) {
                            if (hashRes) {
                                bcrypt.genSalt(saltRounds, function (err, salt) {
                                        bcrypt.hash(newPassword, salt, function (err, hash) {
                                            let username = req.session.user.username;
                                            const insertQuery = "UPDATE user_data SET password_hash=$1 WHERE username=$2";
                                            const insertValues = [hash, username];

                                            dbClient.query(insertQuery, insertValues, function (insertError, insertResponse) {
                                                if (!insertError){
                                                    res.render("profile", {
                                                        acceptedUsername: req.session.user.username,
                                                        successMessage: "Your password was changed!"
                                                    })
                                                }
                                                else{
                                                    res.render("profile", {
                                                        acceptedUsername: req.session.user.username,
                                                        errorMessage: "Something went wrong with the database connection. Please try again later."
                                                    })
                                                }
                                            })
                                        })
                                    }
                                )}
                            else {
                                res.render("profile", {
                                    acceptedUsername: req.session.user.username,
                                    errorMessage: "Your old password is wrong!"
                                })
                            }
                        });
                    } else {
                        res.render("profile", {
                            acceptedUsername: req.session.user.username,
                            errorMessage: "Something went wrong with the database connection. Please try again later."
                        })
                    }
                })
            } else {
                res.render("profile", {
                    acceptedUsername: req.session.user.username,
                    errorMessage: "The new password didn't match with the verify option."
                })
            }
        }
        else{
            res.render("profile", {
                acceptedUsername: req.session.user.username,
                errorMessage: "Please check for empty fields."
            })
        }
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
