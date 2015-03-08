class CommentsController < ApplicationController
	def new
	end

	def create
		@post = Post.find(params[:post_id])

		@comment = @post.comments.build(comment_params)
		@comment.save

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])

		@comment = Comment.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:name, :body)
		end
end
