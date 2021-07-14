class CommentsController < ApplicationController
    def create
        comment = Comment.create(comment: params[:comment], message_id: params[:message_id], user_id: session[:user]['id'])
        redirect_to('/messages')
        flash[:errors] = comment.errors.full_messages
    end
end
