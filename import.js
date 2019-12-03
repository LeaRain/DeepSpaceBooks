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

    databaseConnection.query("SELECT mate_type, amount FROM mate;", function(dbError, dbResponse) {
        console.log("test" + dbResponse.rows);
    });

    // Choosing directory to .csv, utf8 as encoding (today's standard unicode)
    let inputStream = fs.createReadStream("sources/books.csv", "utf8");

    // count_rows counts the rows of the .csv file and is used for detecting an unnecessary line and can be used for debugging
    // (5000 books are required)
    let count_rows = 0;
    // data_array as base for database input TODO: database input
    let data_array = [];

    inputStream
        .pipe(csvReader({ parseNumbers: true, parseBooleans: true, trim: true }))
        .on('data', function (row) {
            // There are some columns author columns with two names -> splitting and as another result, all columns
            // are in an array, so there is an equal data structure for all arrays
            row[2] = row[2].split(",");

            console.log('A row arrived: ', row);
            // The first row isn't necessary because there is only a description
            if (count_rows > 0) {
                data_array.push(row);
            }
            count_rows++;
        })
        .on('end', function (data) {
            console.log('No more rows!');
        });
}

main();
