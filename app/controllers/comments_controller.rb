class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post

    authorize! :create, @comment, message: "You need to be signed up to do that."
    if @comment.save
        redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "There was an error. Please try again."
      render 'posts/show'
    end      
  end
end