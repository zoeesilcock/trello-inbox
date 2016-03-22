Trello Inbox
============

A tool for accepting and tracking ideas and suggestions submitted to Trello.

Installation
============
When the project is first cloned there are a couple of steps that need to be
done to get it running.

```
gem install bundler
gem install powder

bundle exec rake db:create
bundle exec rake db:migrate
```

Install postgres. On Mac the easiest way is using
[Postgress.app](http://postgresapp.com/), for other options see the comments in
`config/database.yml`.

Install the frontend dependencies, note that it requires node version 4.2.x
and npm version 3.3.x (the easiest way to run a specific version of node is
[nvm](https://github.com/creationix/nvm)).
```
npm install
```

You also need to setup the environment variables.
```
cp .env.example .env
```
Add the credentials for Google OAuth2 and Trello.

Updates
-------
When you grab a new version you need to get any new dependencies.
```
bundle install
npm install
```

If the database has changed you need to migrate your local database.

```
bundle exec rake db:migrate
```

Development
-----------
Along side the regular rails server (powder or rails s) you need to start some
other things in development for everything to work. Webpack is used to build
our frontend assets and is required.
```
bundle exec rake webpack
```

Ultrahook is used for allowing Trello to send webhooks to your local machine.
It is only needed if you want get changes from Trello back to your development
environment. Sign up for [ultrahook](http://ultrahook.com) and set the
`WEBHOOK_DOMAIN` environment variable to include your subdomain.
```
bundle exec rake ultrahook
```

Deployment
----------
Trello Inbox is setup to be deployed to Heroku, it also requires Google OAuth2.

### Google OAuth2
This is used for authentication. You'll need to setup OAuth2 credentials with
Google, see the
[Google Developer docs](https://developers.google.com/identity/protocols/OAuth2)
for more info.

### Trello
For the app to integrate with Trello you need a user will be the voice of
Trello Inbox on Trello. You can use an existing user, but it will make more
sense to make a specific user clearly marked as the Inbox user. You can get
the API credentials for your user on [this page](https://trello.com/app-key).
You need the API key and Token. You also need the ID of your Organization,
I don't know of a simple way of finding this at the moment.

### Heroku
Create an app that has the Postgres add-on and hook it up using the Heroku
Toolbelt. See the
[Heroku Docs](https://devcenter.heroku.com/articles/getting-started-with-rails4)
for more details.

You will need to add the necessary buildpacks before deploying.
```
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
```

### Environment variables
The credentials from Google OAuth2 and Trello need to be added to the Heroku
app. It's easiest to push the local `.env` file and then replace the values:
```
heroku config:push
```

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
