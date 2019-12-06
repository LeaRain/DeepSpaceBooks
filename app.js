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

    // TODO: check in form for equivalent passwords
    const selectQuery = "SELECT * FROM user_data WHERE username=$1;";
    const userValue = [username];

    dbClient.query(selectQuery, userValue, function(dbError, dbResponse) {
        // If the 0th element of the array with the database query result contains an undefined
        if (dbResponse.rows[0] === undefined){
            bcrypt.genSalt(saltRounds, function(err, salt) {
                bcrypt.hash(password, salt, function(err, hash) {
                    const insertQuery = "INSERT INTO user_data (username, password_hash) VALUES ($1, $2);";
                    const insertValues = [username, hash];

                    dbClient.query(insertQuery, insertValues, function (dbError, dbResponse) {
                        if (!dbError){
                            console.log("Success!");
                        }
                        else{
                            console.log(dbError);
                        }

                    })
                });
            });
        }

        else{
            console.log("Username not available");
        }

    });
});

// Test function for checking the simple functioning of the post button
app.post("/loginBtn", urlencodedParser, function (req, res) {
    let username = req.body.loginUsername;
    let password = req.body.loginPassword;

    // Empty username and password aren't allowed TODO: Warning and input check
    if (username != "" && password !=""){
        bcrypt.genSalt(saltRounds, function(err, salt) {
            bcrypt.hash(password, salt, function(err, hash) {
                const selectQuery = "SELECT password_hash FROM user_data where username=$1;";
                const userValue = [username];

                dbClient.query(selectQuery, userValue, function(dbError, dbResponse) {
                    console.log(dbResponse.rows);
                    if (dbResponse.rows[0] == password){
                        // TODO: Successful login
                    }
                    else{
                        // TODO: Warning
                    }
                });
            });
        });
    }
    res.redirect("/");
});

app.listen(PORT, function () {
    console.log("Deep Space Books listening on Port ${PORT}");
});
