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
    resave:true,
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
    let resultBoolean = false;

    // Empty username and password aren't allowed TODO: Warning and input check
    if (username !== "" || password !==""){
        const selectQuery = "SELECT password_hash FROM user_data where username=$1;";
        const userValue = [username];

        dbClient.query(selectQuery, userValue, function (dbError, dbResponse) {
            // TODO: Error handling for no such username
            let databaseHash = dbResponse.rows[0].password_hash;
            // For checking if the password is right -> compare function because calculating the hash again will cause another hash result
            bcrypt.compare(password, databaseHash, function(err, hashRes) {
                if (hashRes){
                    resultBoolean === true;
                    res.render("home");
                }
                else{
                    console.log("Login fail");
                    res.render("index", {loginError: "You've entered the wrong password."});
                }
            });
        });
    }

    else{
        res.render("index", {loginError: "Please enter username and password."});
    }

});

app.listen(PORT, function () {
    console.log("Deep Space Books listening on Port ${PORT}");
});
