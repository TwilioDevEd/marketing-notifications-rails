<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# SMS Notifications with Ruby on Rails and Twilio

[![build Status](https://travis-ci.org/TwilioDevEd/marketing-notifications-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/marketing-notifications-rails)

Use Twilio to create sms notifications to keep your subscribers in the loop.

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/marketing-notifications/ruby/rails)!

## Deploy to Heroku

Hit the button!

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Local Development

This project is built using [Ruby on Rails](http://rubyonrails.org/) Framework.

1. First clone this repository and `cd` into it

   ```
   $ git clone git@github.com:TwilioDevEd/marketing-notifications-rails.git
   $ cd marketing-notifications-rails
   ```

1. Install the dependencies.

   ```
   $ bundle install
   ```

1. Copy the `.env.example` file to `.env`, and edit it including your credentials
   for the Twilio API (found at https://www.twilio.com/console/account/settings).
   You will also need a [Twilio Number](https://www.twilio.com/console/phone-numbers/incoming).

   Run `source .env` to export the environment variables.

1. Create the database and run migrations.

   Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on
   a Mac, I recommend [Postgres.app](http://postgresapp.com).

   ```bash
   $ bundle exec rake db:setup
   ```

1. Make sure the tests succeed.

   ```
   $ bundle exec rake
   ```

1. Start the development server.

   ```bash
   $ bundle exec rails s
   ```

1. Twilio will use a publicly accessible endpoint that we need to expose. We recommend using
   [ngrok](https://www.twilio.com/blog/2013/10/test-your-webhooks-locally-with-ngrok.html)
   to solve this problem.

   ```bash
   ngrok http 3000
   ```

1. Configure Twilio to call your webhooks.

   You will also need to configure Twilio to call your application when SMSs are received on your `TWILIO_NUMBER`. Your urls should look something like this:

   ```
   sms:   http://9a159ccf.ngrok.io/incoming
   ```

   ![Configure webhooks](http://howtodocs.s3.amazonaws.com/twilio-number-config-all-med.gif)

1. Check it out at [http://localhost:3000](http://localhost:3000).

That's it!

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.