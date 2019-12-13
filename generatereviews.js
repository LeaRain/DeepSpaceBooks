const pg = require("pg");

function initDatabase() {
// TODO: Change to heroku and connection string (finally, at the end)
    return new pg.Client({
        host: "localhost",
        user: "weirdjs",
        database: "jsexercise"
    });
}

function main() {
    let databaseConnection = initDatabase();
    databaseConnection.connect();

    for (let databaseInserts = 0; databaseInserts < 666; databaseInserts++) {
        insertData(databaseConnection);
    }
}

function insertData(dbConnection){
    let randomUserID = randomizeUserID();
    let randomBookID = randomizeBookID();
    let randomScore = randomizeScore();
    let randomReview = randomizeReview();

    const insertQuery = "INSERT INTO review_information (book_id, user_id, score, review_date, review_time, review_text) values ($1, $2, $3, CURRENT_DATE, CURRENT_TIME, $4);";
    const insertValues = [randomBookID, randomUserID, randomScore, randomReview];

    dbConnection.query(insertQuery, insertValues, function (dbError, dbResponse) {
        if (!dbError) {
            console.log("Success! " + dbResponse);
        }
        else{
            // This occurs for entries which are already there for a book and a user.
            console.log(dbError);
        }
    })
}

function randomizeUserID(){
    // This array contains the existing IDs
    let userIDs = [1, 12, 13, 15, 16, 17, 18, 19, 20];
    let randomizer = getRandomInt(userIDs.length-1);

    return userIDs[randomizer];
}

function randomizeBookID(){
    return getRandomInt(5000);
}

function randomizeScore(){
    return getRandomInt(5)+1;
}

function randomizeReview(){
    let beginning = ["I think this book ", "The protagonist ", "The story ", "The female character ", "The plot ", "I wish this book ", "It "];
    let mid = ["shows us ", "describes ", "is ", "feels ", "requires ", "wishes ", "tells us about ", "believes in ", "needs "];
    let ending = ["a beautiful story.", "just wrong.", "a breach in humanity.", "more chocolate.", "just dark.", "cold and dump.", "my deepest wish.", "technical issues."];

    let beginningRandom = getRandomInt(beginning.length);
    let midRandom = getRandomInt(mid.length);
    let endingRandom = getRandomInt(ending.length);

    // Returning a concatenated string with a potential review
    return beginning[beginningRandom] + mid[midRandom] + ending[endingRandom];

}

function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}


main();