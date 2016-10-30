class CommentsController < ApplicationController

	layout "admin"
	
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(comment_params)
  	@comment.save

  	redirect_to @post
  end

   

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to post_url
  end

   def comment_params 
        params.require(:comment).permit(:text)
   end
end
