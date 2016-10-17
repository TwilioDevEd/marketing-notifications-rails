<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# SMS Notifications - Rails

[![build Status](https://travis-ci.org/TwilioDevEd/marketing-notifications-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/marketing-notifications-rails)

Use Twilio to create sms notifications to keep your subscribers in the loop.

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/marketing-notifications/ruby/rails)!

## Deploy to Heroku

Hit the button!

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Local Development

Clone this repository and cd into the directory then.

  ```
  $ git clone git@github.com:TwilioDevEd/marketing-notifications-rails.git
  $ cd marketing-notifications-rails
  ```

1. Install dependencies

  ```
  $ bundle install
  ```

1. Expose your application to the wider internet using [ngrok](http://ngrok.com). This step
   is important because the application won't work as expected if you run it through
   localhost.

   ```bash
   $ ngrok http 3000
   ```

   Your ngrok URL should look something like this: `http://9a159ccf.ngrok.io`

   You can read [this blog post](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
   for more details on how to use ngrok.

1. Configure Twilio to call your webhooks

   You will also need to configure Twilio to call your application when calls or SMSs are received on your `TWILIO_NUMBER`. Your urls should look something like this:

   ```
   sms:   http://9a159ccf.ngrok.io/incoming
   ```

   ![Configure webhooks](http://howtodocs.s3.amazonaws.com/twilio-number-config-all-med.gif)

1. Create application's database

Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com). Given that, we'll use a rake task to generate the database used by the app. You just need to provide a valid user with permission to create databases.

  ```
  $ bundle exec rake db:create db:migrate
  ```

1. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   $ cp .env.example .env
   ```

   You can find your `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` in your
   [Twilio Account Settings](https://www.twilio.com/console/account/settings).
   You will also need a `TWILIO_NUMBER`, which you may find [here](https://www.twilio.com/console/phone-numbers/incoming).

   Run:
   ```bash
   $ source .env
   ```
   to export the environment variables.

1. Make sure the tests succeed

  ```
  $ bundle exec rake
  ```

1. Start the server.

   ```bash
   $ bundle exec rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000).

That's it!

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.