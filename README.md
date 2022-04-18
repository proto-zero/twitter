# <a href="https://search-twi.herokuapp.com/">Twitter Search</a>

## This app is built with Ruby on Rails with a PostGres Database

## Notes

Users may select one of three topics. 

The ten most recent tweets about said topic will be displayed.

## Ruby Version
    3.0.4

## Postgres
    1.1

### If you want your own version of this, you should:
- have rails installed
- clone this repo
- <code>rails db:migrate</code>
- <code>rails server</code>
- open localhost:3000

## Developer Notes

- My first attempt at the project was a simple test app using SQLite. The project would have to later be rebuilt using PostGres so as to be supoorted by Heroku.

- Building the Rails App involved creating a database in which to store tweets. I designed two tables: Topics with a Title string, and Posts with a Body of text and a topics_id integer.

- I created some test data for the database and built a rudimentary view to observe calling the database.

- After setting up a dev account with Twitter I was able to access their V2 API. This led to some problems as the most highly searched gem (and the one recommended by the challenge itself), the Twitter Gem, apparently only worked with V1.1 and was not up to date with V2. After much research and experimentation I found the <a href="https://github.com/julianfssen/tweetkit">Tweetkit Gem</a>.

- Tweetkit is based off of the Twitter Gem, but the way it calls endpoints is slightly different. There is very little documentation on the github for the gem, but I found a post on a forum where the creator shared a few endpoint calls. I was able to reconfigure one such call into a searchable call and limit the total number of tweets returned to ten.

- Once I had successfully connected with the Twitter API I was able to save tweets to the Posts database, connecting the table to Topics by giving each Post tweet's topic_id the same ID as the Topic which was searched. 

- In order to update the database, I decided to clear the database everytime a new topic was selected by the user, then refill the database with the most recent tweets from Twitter.

- I gave the views some simple styling, making sure to keep the colors comfortable to the eye in a darkmode setting, as well as creating a responsive build for mobile screens.

- Now that the app was functioning I rebuilt it with a PostGres Database.

- Connecting the Rails App to Heroku for free hosting is always an adventure with many steps: Adding a Procfile, Updating Ruby, Migrating the database, Seeding the new database with Topics.