class NotificationsController < ApplicationController
  before_action :set_subscriber, only: [:incoming]
  
  # Receive incoming SMS
  def incoming
    begin
      if @new_subscriber
        output = "Thanks for contacting TWBC! Text 'subscribe' if you would to receive updates via text message."
      else
        if @body == 'subscribe' || @body == 'unsubscribe'
          # If the user has subscribed flip the bit
          # and let them know
          subscribed = @body === 'subscribe'
          @subscriber.update :subscribed => subscribed

          # Respond appropriately
          output = "You are now subscribed for updates."
          if !@subscriber.subscribed
            output = "You have unsubscribed from notifications. Test 'subscribe' to start receieving updates again"
          end
        else
          # If we don't recognize the command, text back with the list of
          # available commands
          output = "Sorry, we don't recognize that command. Available commands are: 'subscribe' or 'unsubscribe'."
        end
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
    puts message
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
    # See above ---> before_action :set_subscriber, only: [:receiver]
    def set_subscriber
      # Grab the phone number from incoming Twilio params
      @phone_number = params[:From]

      # Find the subscriber associated with this number or create a new one
      @new_subscriber = Subscriber.exists?(:phone_number => @phone_number) === false
      @subscriber = Subscriber.first_or_create(:phone_number => @phone_number)

      @body = if params[:Body].nil? then '' else params[:Body].downcase end
    end

    # Send an SMS back to the Subscriber
    def respond(message)
      response = Twilio::TwiML::Response.new do |r|
        r.Message message
      end
      render text: response.text
    end

end
