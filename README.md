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
foreman start -f Procfile.dev
```

Ultrahook is used for allowing Trello to send webhooks to your local machine.
It is only needed if you want get changes from Trello back to your development
environment. Sign up for [ultrahook](http://ultrahook.com) and set the
`WEBHOOK_DOMAIN` environment variable to include your subdomain.
```
bundle exec rake ultrahook
```

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
