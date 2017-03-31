# Mentory
This app is meant to be a client project for DBC, building/improving upon the existing pairing is caring application. 
Things you'll need to be up to date in our code --
* ruby 2.3.3
* ruby on rails 5.x installed
* heroku account: we are using postgres for our database with the intention of deploying on heroku.
* the gmail account name and password, ask Liz, Kristen, or Karl
The above gmail info is for sending emails to mentors/mentees for status updates on their pairings

Clone down:
```
git clone https://github.com/chi-foxes-2017/mentory.git
cd mentory
```

Database creation:
```
rails db:create
rails db:migrate
rails db:seed
```

We were pushing to our own repositories in order to implement Circle CI before consolidating our branches here. 
but for general testing: We are using rspec testing. 
```
rails spec
```

deployment local
```
rails server
```

for production deployment follow herokus guide on rails 5.
https://devcenter.heroku.com/articles/getting-started-with-rails5

