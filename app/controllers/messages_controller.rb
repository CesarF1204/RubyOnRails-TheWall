class MessagesController < ApplicationController
    def index
        return redirect_to "/users/new" unless session[:user]
        @messages = Message.all
    end
    def create
        message = Message.create(message: params[:message], user_id: session[:user]['id'])
        if message.save
            redirect_to('/messages')
        else
            flash[:errors] = message.errors.full_messages
            redirect_to('/messages')
        end
    end
end
