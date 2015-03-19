class NotificationsController < ApplicationController
  before_action :set_subscriber, only: [:receiver]
  
  # Receive incoming SMS
  def incoming
    begin
      if @subscriber.valid?
        respond('Great! You will now be subscribed to notifications from TWBC!')
      else
        respond('Something went wrong. Try again.')
      end
  end

  # Create a new notification
  def new

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # See above ---> before_action :set_subscriber, only: [:receiver]
    def set_subscriber
      # Grab the phone number from incoming Twilio params
      @phone_number = Sanitize.clean(params[:From])

      # Find the subscriber associated with this number or create a new one
      @subscriber = Subscriber.first_or_create(:phone_number => @phone_number)

      @body = if params[:Body].nil? then '' else params[:Body].downcase end
    end

    # Send an SMS back to the Subscriber
    def respond(message)
      Twilio::TwiML::Response.new do |r|
        r.Message message
      end.text
    end

end
