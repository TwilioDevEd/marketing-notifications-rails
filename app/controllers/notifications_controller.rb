class NotificationsController < ApplicationController
  # Receive incoming SMS
  def incoming
    # Grab the phone number from incoming Twilio params
    phone_number = params[:From]

    # Find the subscriber associated with this number or create a new one
    subscriber_exists = Subscriber.exists?(phone_number: phone_number)
    subscriber = Subscriber.find_or_create_by(phone_number: phone_number)

    begin
      if subscriber_exists
        # Process the command from our subscriber
        body = params.fetch(:Body, '').downcase
        output = process_message(body, subscriber)
      else
        output = "Thanks for contacting TWBC! Text 'add' if you would to receive updates via text message."
      end
    rescue
      output = "Something went wrong. Try again."
    end

    # Render the TwiML response
    respond(output)
  end

  # Create a new notification
  def new
    message = params[:message]
    image_url = params[:image_url]

    Subscriber.all.each do |s|
      begin
        s.send_message(message, image_url)
        flash[:success] = "Messages on their way!"
      rescue
        flash[:alert] = "Something when wrong."
      end
    end
    redirect_to '/'
  end

  def index
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Process incoming SMS
  def process_message(message, subscriber)
    if message == 'add' || message == 'remove'
      # If the user has subscribed flip the bit
      # and let them know
      subscribed = message == 'add'
      subscriber.update subscribed: subscribed

      # Respond appropriately
      output = "You are now subscribed for updates."
      if !subscriber.subscribed
        output = "You have unsubscribed from notifications. Test 'add' to start receieving updates again"
      end
    else
      # If we don't recognize the command, text back with the list of
      # available commands
      output = "Sorry, we don't recognize that command. Available commands are: 'add' or 'remove'."
    end
    return output
  end

  # Send an SMS back to the Subscriber
  def respond(message)
    response = Twilio::TwiML::MessagingResponse.new
    response.message(body: message)
    render xml: response.to_s
  end
end
