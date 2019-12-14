class PostsController < ApplicationController

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            flash[:notice] = 'Post created!'
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes
            flash[:notice] = 'Post updated!'
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy!
        redirect_to subs_url
    end

    private

    def post_params
        params.require(:post).permit(:title, :author_id, :content, :url)
    end
end
