class CommentsController < ApplicationController
  def index
    @shoes = Shoe.order(created_at: :asc)
    render "comments/comment.html.erb"
  end 

  def create_comment

    comment = Comment.new

    comment.body = params.fetch("query_comment")
    comment.author_id = session.fetch(:user_id)
    comment.shoe_id = shoe_id = params.fetch("query_shoe_id")
    
    comment.save
    
    redirect_to "/comments", notice: "Comment added successfully"
  end

  def edit
    @shoes = Shoe.order(created_at: :asc)
    render "comments/edit_comments.html.erb"
  end

  def update_comment
    comment_id = params.fetch(:id)
    comment = Comment.where(id: comment_id)[0]

    comment.body = params.fetch("query_comment")
    comment.author_id = session.fetch(:user_id)
    comment.shoe_id = params.fetch("query_shoe_id")

    comment.save

    redirect_to "/comments", notice: "Comment updated successfully"
  end

  def destroy
    id = params.fetch(:id)

    comment = Comment.where(id: id)[0]
    comment.delete

    redirect_to "/comments", notice: "Comment successfully deleted"
  end
end
