<a  href="https://www.twilio.com">
<img  src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg"  alt="Twilio"  width="250"  />
</a>
 
# SMS Notifications with Ruby on Rails and Twilio

![](https://github.com/TwilioDevEd/marketing-notifications-rails/actions/workflows/build.yml/badge.svg)

## About

Use Twilio to create sms notifications to keep your subscribers in the loop.

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/marketing-notifications/ruby/rails)!

## Local development

This project is built using [Ruby on Rails](http://rubyonrails.org/) and [NodeJS](https://nodejs.org/en/) Frameworks.

1. First clone this repository and `cd` into it.

   ```
   $ git clone git@github.com:TwilioDevEd/marketing-notifications-rails.git
   $ cd marketing-notifications-rails
   ```

1. Install Rails the dependencies.
   ```
   $ bundle install
   ```

1. Install Webpack the dependencies.
   ```
   $ npm install
   ```

1. Expose your application to the wider internet using [ngrok](http://ngrok.com). This step is important because the application won't work as expected if you run it through localhost.
   ```bash
   $ ngrok http 3000
   ```

   Your ngrok URL should look something like this: `http://9a159ccf.ngrok.io`

   You can read [this blog post](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
   for more details on how to use ngrok.

1. Configure Twilio to call your webhooks.

   You will also need to configure Twilio to call your application when SMSs are received on your `TWILIO_NUMBER`. Your urls should look something like this:

   ```
   sms:   http://9a159ccf.ngrok.io/incoming
   ```

1. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   $ cp .env.example .env
   ```

   You can find your `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` in your
   [Twilio Account Settings](https://www.twilio.com/console/account/settings).
   You will also need a `TWIML_APPLICATION_SID`, which you may find [here](https://www.twilio.com/console/phone-numbers/runtime/twiml-apps). The webhooks can be left empty as they will be configured later.

1. Create database and run migrations.

   _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_

   ```bash
   $ bundle exec rails db:setup
   ```

1. Make sure the tests succeed.

   ```bash
   $ bundle exec rails test
   ```

1. Start the server.

   ```bash
   $ bundle exec rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000)

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](LICENSE)
* Lovingly crafted by Twilio Developer Education.
