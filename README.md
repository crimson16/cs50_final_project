cs50_final_project
==================

CS 50 Final Project

DOCUMENTATION

CS50 Election Tracker

In order to compile our project, open up the terminal and execute "python manage.py runserver 8000"

Our site is hosted locally, so open up a browser and visit "localhost:8000"

Upon opening the site, you are first presented with our home page. The CS50 Election Tracker automatically detects what congressional district you are visiting the webpage from, and returns political news for that district on the homepage. Also displayed on the homepage is the information for your local legislators, and previous election results for your district. Clicking on one of your local legislators will take you to their official twitter page or member website. We hope that users will immediately have their attention grabbed by news and information that is pertinent to them.

From the home page, you are able to access various of our other features via the sidebar. 
    - You can view a map visualization of United States election results. (darkness of color indicates strength of democrat presence)
    - You can view data and results on senate election polls from around the country, presented in an easy-to-read format
    - You can view data and results on important house election polls from around the country, presented in an easy-to-read format
    - You can view data and results from the most recent presidential elections for districts around the country
    - You can learn about our mission, what we're doing, how we're doing it, and the creators of this project in the "About Us" section

* if no results are showing up for the various polls, the data base may be empty, which can be fixed by running "python manage.py syncdb" in the terminal. After synching the data base, paste the parse files into the Python manage.py shell.


DESIGN

Our project’s mission is to encourage citizens to inform themselves about politics and strengthen our democracy through political education and engagement.

Our homepage is the centerpiece for our website, and on it the user is greeted by their local news, and a table filled the user’s senators and congressional representatives from their district (plus links to their twitter and congress page). We get the geolocation using google's geolocater. The content on the page then comes from a mixture of the sunlight api and our data base. We decided to use django for the framework of our site becasue the queries are really intuative. We also used it bacause it works well with python, which is what we used to get the data from our sources.

This information is then displayed in a user-friendly table, generated with coffeescipt, a cool new language. The table is also styled using bootstrap's table elements. We chose to use a table because it is a framilar form of data. 

If you click on the link to our political map, you will see an interactive election map showing varying degrees of blue states from the 2012 election. This give one an idea of how strongly democrat leaning one's home state is. We made this getting data from django calls to the data base, and then visualizing the map using d3.js. The D3 makes it fun to play with the election results because you can really get a grasp on the dynamic of the nation

Moving on you can see the election results output. It has the aggregrated election polls for the 2014 senate and house elections. This is a nice subset of the most competitive elections of the year. The data again comes from a url call that pulls the election polls from our data base.

Last is a full table that has all of the election 2012 state presidential results. This gives you the best sense of the breakdown of the nation for each given area. The data here again comes from the data base via a url call.

In the end, our project covers a great deal of election material. Django makes it so that we can get our data via url calls, and it also is great becasue the templating format (ex. { content block } ) allows you to have a really seemless transition from one page to another. Python was a great language for getting the data (which was really hard) and coffeescript and d3 allowed for fun interactive website (especially the map).