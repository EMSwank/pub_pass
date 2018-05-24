class CommentsController < ApplicationController
def create
  beer = Beer.find(params[:beer_id])
  # @comment = Comment.new
  # @comment.beer_id = @beer.id
  # @comment.user_id = current_user.id
  # @comment.save
  comment = current_user.comments.new(comment_params)
  comment.beer_id = beer.id
  comment.save
  # binding.pry
  redirect_to beer_path(beer)
end

private

  def comment_params
    params.require(:comment).permit(:beer_id, :body)
  end
end