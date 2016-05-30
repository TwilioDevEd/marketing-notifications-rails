# SMS Notifications
[![build Status](https://travis-ci.org/TwilioDevEd/marketing-notifications-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/marketing-notifications-rails)

Use Twilio to create sms notifications to keep your subscribers in the loop.

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/marketing-notifications/ruby/rails)!

## Deploy to Heroku

Hit the button!

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Running the application


1. First clone this repository and `cd` into it

```
git clone git@github.com:TwilioDevEd/marketing-notifications-sinatra.git
cd marketing-notifications-sinatra
```

1. Install dependencies

```
bundle
```

1. Create application's database

Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com). Given that, we'll use a rake task to generate the database used by the app. You just need to provide a valid user with permission to create databases.

```
bundle exec rake db:create db:migrate
```

1. Export environment variables.

You can find `AccountSID` and the `AuthToken` at [https://www.twilio.com/user/account/settings](https://www.twilio.com/user/account/settings).

```
export TWILIO_ACCOUNT_SID=your account sid
export TWILIO_AUTH_TOKEN=your auth token
export TWILIO_NUMBER=your twilio number

```

1. Make sure the tests succeed

```
bundle exec rake spec
```

1. Run the server

```
rails server
```

1. Expose application endpoint

In order to receive subscribers you will need to point a Twilio number to the app running.
To do that we can use [ngrok](https://ngrok.com/) to expose the application
to the wilder internet.

```
  ngrok http 3000
```


1. Configure your Twilio number

Go to your dashboard on [Twilio](https://www.twilio.com/user/account/phone-numbers/incoming).
Click on Twilio Numbers and choose a number to setup.
On the phone number page, enter the address provided by ngrok into the _Messaging_ Request URL field.

![Request URL](http://howtodocs.s3.amazonaws.com/setup-twilio-number.png)

1. Wrap Up!

By now, your application should be up and running at [http://localhost:3000/](http://localhost:3000).
Now your subscribers will be able to text your new Twilio number to Subscribe
to your Marketing Notifications line.

Congratulations!

## Dependencies

This application uses this Twilio helper library:
* twilio-ruby

Please visit these libraries and pay your respects.

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
