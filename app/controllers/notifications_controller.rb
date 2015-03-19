class NotificationsController < ApplicationController
  before_action :set_subscriber, only: [:incoming]
  
  # Receive incoming SMS
  def incoming
    begin
      if @subscriber.valid?
        output = 'Great! You will now be subscribed to notifications from TWBC!'
      else
        output = 'Something went wrong. Try again.'
      end
    rescue
      output = 'Something went wrong. Try again.'
    end

    # Render the TwiML response
    respond(output)
  end

  # Create a new notification
  def new

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # See above ---> before_action :set_subscriber, only: [:receiver]
    def set_subscriber
      # Grab the phone number from incoming Twilio params
      @phone_number = params[:From]

      # Find the subscriber associated with this number or create a new one
      @subscriber = Subscriber.first_or_create(:phone_number => @phone_number)

      @body = if params[:Body].nil? then '' else params[:Body].downcase end
    end

    # Send an SMS back to the Subscriber
    def respond(message)
      puts "************************ #{message}"
      response = Twilio::TwiML::Response.new do |r|
        r.Message message
      end
      render text: response.text
    end

end
