# Deep Space Books
Deep Space Books was build with Manjaro 18.1.4 Juhraya, PostgreSQL 12 and NodeJS 13.3.0. 
The container deployment part was build with Docker 19.03.5-ce.
## Install and Login
### Versions
DeepSpaceBooks comes in two different versions: Community Edition and 
Professional Edition.    
Heroku only supports 10000 rows in the free version. DeepSpaceBooks needs 
a lot of rows: 5000 for the books, nearly 2000 for the authors, users 
and reviews missing. With for example 5 users, 25000 reviews are possible.  
Heroku shouldn't explode. Because of this, there is a Professional Edition.

#### Professional Edition (recommended)
Deep Space Book can be self-hosted and this is also the recommended version for more 
control of the database, the row limit and privacy, because it's hosted on own infrastructure 
and not (for example) on Amazon Web Services.   
There are two options for installing as local version: The first one is by hand on your own 
system with self-install and configuration of the necessary components. The second one is 
made for easy deployment, based on Docker containers.

Normally, Docker should be the fastest, most automated and the easiest one.
##### Install by hand
1. Install NodeJS and PostgreSQL (version 12 preferred, 11 needs a trick explained below.)
2. Use the terminal to find your path to this project (normally the path where you cloned
this) and use `npm install` for installing the necessary packages. If there are any problems, 
please follow the instructions of npm.
3. Create the database `jsexercise` and a user called `weirdjs`. A password shouldn't be 
necessary, but if you want to use one, please enter a password in `app.js`, so that there 
should be a line (or more) like this:
`let dbClient = new pg.Client({
     host: "localhost",
     user: "weirdjs",
     database: "jsexercise",
     password: "<yourpassword>"
 });`   
 In addition, please make sure your user `weirdjs` has enough rights and privileges on your 
 database.
4. Import the dump `jsexercise.sql` with your database. The base commend should be 
`psql jsexercise < jsexercise.sql`. A known error can be caused by incorrect privilege 
settings, please check this, if such an error occurs. Another known error can be caused 
by using version 11 of PostgreSQL. The line `SET default_table_access_method = heap;` couldn't 
be recognized by version 11, please remove or uncomment this line and try again.  
5. Please check your code in `app.js` (and potentially also `import.js` 
and `generatereviews.js` if you want to take a closer look at them) for uncommented and 
commented code which is also described in the app.
6. Run `ǹode app.js` and access Deep Space Book with `localhost:3000`.

Troubleshooting: Please check the database for success of the dump import and npm for 
any problems. If your PostgreSQL isn't responding, please try to run 
`systemctl start postgresql`, you may run this with `sudo`. If your system doesn't know 
`systemctl`, you should check for starting a PostgreSQL server or daemon on your operating 
system.

##### Install by Docker
1. Install docker and docker-compose.
2. Use the find your path to this project (normally the path where you cloned this) 
and check for `docker-compose.yml`, `Dockerfile` and `start.sh` as necessary files for 
the container build.
3. Run `docker-compose build` for building your container, you may run this with `sudo`.
4. Run `docker-compose up` for starting your container, you may run this with `sudo`.
5. Please check your code in `app.js` (and potentially also `import.js` and 
`generatereviews.js` if you want to take a closer look at them) for uncommented and 
commented code which is also described in the app.
6. Access Deep Space Book with `localhost:3000`.

Troubleshooting: If your docker daemon isn't running, please start with 
`systemctl start docker`, you may run this with `sudo` on a Linux System. If you don't use 
a Linux system, please check the documentation for your operating system and how to start 
your Docker daemon. 

#### Community Edition
##### Install by Heroku
1. Install NodeJS.
2. Use the terminal to find your path to this project (normally the path where you cloned
this) and use `npm install` for installing the necessary packages. If there are any problems, 
please follow the instructions of npm.
3. Please set a connection string `DB_CON_STRING` with 
`postgres://ngzfzadntqjdem:31d89d7859455fafdf2af3bf804c7e69376901bc1f42689c94940191249f1d92@ec2-54-217-234-157.eu-west-1.compute.amazonaws.com:5432/d13114mb2mod5v`
4. Please check your code in `app.js` (and potentially also `import.js` if you want 
to take a closer look at them) for uncommented and commented code which is also 
described in the app.
5. Run `ǹode app.js` and access Deep Space Book with `localhost:3000`.

### Login
For using Deep Space Books, it's possible to create a new account in the registry process. 
There is also the possibility of using an existing account. If you want to work on your 
hacking skills, select an username and a password hash from the table for user data and 
try to get the password out of it. Salt can be found in `app.js`. As an alternative, you 
can also use this login data:
* Username: FulBukat
* Password: test1234

## Features
Besides the required tasks, Deep Space Book has some special features:
* Different search options: Quick search (based on keyword search), keyword
 search (enter a keyword, every necessary part get check) and detail search
 (more detailed, like the name says)    
* Profile page: Password change possible    
* Author list: List of all available main authors    
* Book list: List of all available books     
* Review feed: Latest 100 reviews are shown in a kind of feed with
 information about the book and with links to those books.
* Author pages: See (and click) the books of a main author    
* Links in book information: Links of all books contain a link to the
 author    
* Hashed passwords: Passwords are stored in a hashed form in the database 
 with bcrypt   
* One person, one review: Every person can post one review.     
* Additional review information: See who wrote a review with date and time    
* Script generatereviews.js: Generator for even more (static) reviews 
based on randomness -> Only for local hosted version recommended  (row
limit of Heroku)
* Docker support

## Coding Notes 
### var vs. let
In most cases, let is used instead of var for enabling function scope instead 
of block scope as a default. With EcmaScript6 (and EcmaScript5), let prevents the unexpected
and weird behavior of var. In some cases, also const is a possible option for
variables which won't be reassigned. So for less confusing and more block
scoping, my choice is the choice for let and const instead of var. I also 
want to disable the hoisting mechanism of var. Writing a function, it may 
have weird side effects, if I use a variable before assignment and it seems 
to work but not the way I'd like.   
There are a lof of discussions about var, let and const out there in the huge
internet world. I don't want to write an essay about my programming style 
choices but I want to take a note about this. For further information, here
are some websites:
* https://medium.com/javascript-scene/javascript-es6-var-let-or-const-ba58b8dcde75
* https://softwareengineering.stackexchange.com/questions/274342/is-there-any-reason-to-use-the-var-keyword-in-es6
* https://babeljs.io/docs/en/learn#let-const

## Pug Files and Templates
I've decided to make every page for its own, which could cause duplicated 
code. But there are often small, unique differences, so there would be 
a lot of templates, because there are so special differences.
