class CommentsController < ApplicationController

    def new
        @comment = Comment.new(post_id: params[:post_id])
    end

    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save!
            flash[:notice] = 'Comment created'
            redirect_to post_url(@comment.post_id)
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to new_post_comment_url(@comment.post_id)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :post_id, :parent_comment_id)
    end
end
