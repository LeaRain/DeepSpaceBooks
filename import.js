const csvReader = require("csv-reader");
const fs = require("fs");
const pg = require("pg");

function initDatabase() {
// TODO: Change to heroku and connection string (finally, at the end)
    return new pg.Client({
        host: "localhost",
        user: "weirdjs",
        database: "jsexercise"
    });
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
        .on('data', function (row) {
            // There are some columns author columns with two names -> splitting and as another result, all columns
            // are in an array, so there is an equal data structure for all arrays
            row[2] = row[2].split(",");

            //console.log('A row arrived: ', row);
            // The first row isn't necessary because there is only a description
            if (count_rows > 0) {
                insertBookData(row, databaseConnection);
            }
            count_rows++;
        })
        .on('end', function (data) {
            // Terminates the process effectively
            //process.exit();
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

function insertBookData(rowData, databaseConnection){
    let isbn = rowData[0];
    let title = rowData[1];
    let publishYear = rowData[3];
    let author = rowData[2][0];
    let coauthor = rowData[2][1];
    
    if (rowData[2].length < 2){
        const insertQuery = "INSERT into book_information (title, author, isbn, publish_year) VALUES ($1, $2, $3, $4);";
        const insertValues = [title, author, isbn, publishYear];

        databaseConnection.query(insertQuery, insertValues, function(dbError, dbResponse) {
            if (dbError){
                // Potential error as log entry
                console.log("Error occurred:" + dbError);
            }
            else{
                console.log("Success!")
            }
        });
    }

    else{
        const insertQuery = "INSERT into book_information (title, author, coauthor, isbn, publish_year) VALUES ($1, $2, $3, $4, $5);";
        const insertValues = [title, author, coauthor, isbn, publishYear];

        databaseConnection.query(insertQuery, insertValues, function(dbError, dbResponse) {
            if (dbError){
                // Potential error as log entry
                console.log("Error occurred:" + dbError);
            }
            else{
                console.log("Success!")
            }
        });
    }
}

main();