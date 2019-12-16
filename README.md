# Deep Space Books
## Login, Install, Use
### Versions
DeepSpaceBooks comes in two different versions: Community Edition and 
Professional Edition.    
Heroku only supports 10000 rows in the free version. DeepSpaceBooks needs 
a lot of rows: 5000 for the books, nearly 2000 for the authors, users 
and reviews missing. With for example 5 users, 25000 reviews are possible.  
Heroku shouldn't explode. Because of this, there is a Professional Edition.

#### Community Edition
##### Install by Heroku
Please install the Node JS part with the necessary packages and connect 
with the Heroku PostgreSQL database with the following connection string:   
postgres://ngzfzadntqjdem:31d89d7859455fafdf2af3bf804c7e69376901bc1f42689c94940191249f1d92@ec2-54-217-234-157.eu-west-1.compute.amazonaws.com:5432/d13114mb2mod5v

* host: ec2-54-217-234-157.eu-west-1.compute.amazonaws.com
* database: d13114mb2mod5v
* username: ngzfzadntqjdem
* password: 31d89d7859455fafdf2af3bf804c7e69376901bc1f42689c94940191249f1d92


#### Professional Edition
##### Install by hand
Make sure, you have NodeJS and PostgreSQL installed. The packages can be 
found in package.json. In this repository, there is a dump of the database.  
Please load this dump in your PostgreSQL database and check for: 
* user: weirdjs   
* database: jsexercise   
* password isn't required

Please check also for commented and uncommented parts of the code and 
look for the instructions in the comments.

##### Install by Docker
This repository contains some Docker related files. Run them with docker 
compose build and docker compose up. Be sure to comment the necessary parts 
of the code in and the rest out.

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