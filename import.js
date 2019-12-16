const csvReader = require("csv-reader");
const fs = require("fs");
const pg = require("pg");

function initDatabase() {
/* COMMENT THIS PART IN FOR LOCALHOSTED EDITION (AND THE REST OUT)
    return new pg.Client({
        host: "localhost",
        user: "weirdjs",
        database: "jsexercise"
    });
 */
    // COMMENT THIS PART IN FOR LOCALHOSTED EDITION (AND THE REST OUT)
    let CON_STRING = process.env.DB_CON_STRING;
    if (CON_STRING == undefined) {
        console.log("Error: Environment variable DB_CON_STRING not set!");
        process.exit(1);
    }
    // For Docker, SSL can be ignored
    return new pg.Client(CON_STRING)
}

function main(){
    let databaseConnection = initDatabase();
    databaseConnection.connect();

    tryCreateTable(databaseConnection);

    // Choosing directory to .csv, utf8 as encoding (today's standard unicode)
    let inputStream = fs.createReadStream("sources/books.csv", "utf8");

    // count_rows counts the rows of the .csv file and is used for detecting an unnecessary line and can be used for debugging
    // (5000 books are required)
    let count_rows = 0;

    inputStream
        .pipe(csvReader({ parseNumbers: true, parseBooleans: true, trim: true }))
        .on("data", function (row) {
            // There are some columns author columns with two names -> splitting and as another result, all columns
            // are in an array, so there is an equal data structure for all arrays
            row[2] = row[2].split(",");

            // The first row isn't necessary because there is only a description
            if (count_rows > 0) {
                insertBookData(row, databaseConnection);
            }
            count_rows++;
        })
}

function tryCreateTable(databaseConnection){
    // Definition of table in one static string -> more clarity
    // book_id as primary key, ISBN could have been a possibility, but ids out of the database are more easy to handle for foreign keys and joins. ISBN is in fact unique, so there is an unique tag. All other varchars have a generous size, the possibility of a second author is realized in a column for coauthor. A year has to be larger than 0 so a long journey to the past is prevented.
    // There is also the possibility of an already existing table
    const tableDefinition = "CREATE TABLE IF NOT EXISTS book_information (book_id SERIAL PRIMARY KEY, title VARCHAR(200) NOT NULL, author VARCHAR(200) NOT NULL, coauthor VARCHAR(200), isbn VARCHAR(10) NOT NULL UNIQUE, publish_year SMALLINT NOT NULL CHECK (publish_year > 0));";
    databaseConnection.query(tableDefinition, function(dbError, dbResponse) {
        if (dbError){
            // Potential error as log entry
            console.log("Error occurred:" + dbError);
        }
        else{
            console.log("Table was created (or found) successfully.")
        }
    });
}

// If insertBookData is called with an already existing table with all the necessary data, a database error will occur because isbn is per definition of table an unique value
function insertBookData(rowData, databaseConnection){
    // Define the constant factors of this function, including different data specifications and queries with values, it would also be possible to ignore isbn, title, publishYear, author and coauthor but readability is a thing.
    const isbn = rowData[0];
    const title = rowData[1];
    const publishYear = rowData[3];
    const author = rowData[2][0];
    const coauthor = rowData[2][1];

    // Insert statement and parameters have a coauthor but if there is only one author, coauthor is undefined -> no insert for coauthor
    const insertQuery = "INSERT into book_information (title, author, coauthor, isbn, publish_year) VALUES ($1, $2, $3, $4, $5);";
    const insertValues = [title, author, coauthor, isbn, publishYear];

    databaseConnection.query(insertQuery, insertValues, function(dbError, dbResponse) {
        if (dbError){
            // Potential error as log entry
            console.log("Error occurred while inserting:" + dbError);
        }
        else{
            // More precise information about success
            console.log("Data inserted successfully!");
        }
    });
}

main();