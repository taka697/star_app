class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(tweet_id: params[:tweet_id], body: params[:comment][:body])
    byebug
    comment.save
    # redirect_to tweet_path(tweet_id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    comment.delete
    redirect_to tweet_path
  end
end
