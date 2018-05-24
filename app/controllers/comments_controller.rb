class CommentsController < ApplicationController
def create
  @beer = Beer.find(params[:beer_id])
  @comment = Comment.new
  # binding.pry
  @comment.beer_id = @beer.id
  @comment.save

  redirect_to beer_path(@beer)
end

private

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end