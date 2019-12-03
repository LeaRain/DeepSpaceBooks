// Required modules are set to const -> They won't be change in the process, they are some kind of static, so change to constant
const express = require("express");
const pg = require("pg");
const bodyParser = require("body-parser");
const session = require("express-session");

// Instead of using a connection string, for local use and development, there is a simple connection with my own "server".
// Yes, there isn't a password and for local development, this is okay, I'm the only person with access to my database in my networks.
// TODO: Change to heroku and connection string (finally, at the end)
let dbClient = new pg.Client({
    host: "localhost",
    user: "weirdjs",
    database: "jsexercise"
});

dbClient.connect();

var urlencodedParser = bodyParser.urlencoded({
    extended: false
});

const PORT = 3000;

var app = express();

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

app.listen(PORT, function () {
    console.log("Deep Space Books listening on Port ${PORT}");
});
