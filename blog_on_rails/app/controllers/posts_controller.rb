class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:edit, :update, :delete]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params
        @post.user = current_user
        if @post.save
            flash[:primary] = "Post created!"
            redirect_to post_path(@post.id)
        else
            render :new
        end
    end
    
    def show
        @comment = Comment.new

        @comments = @post.comments.order(created_at: :desc)
    end

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def edit
        unless can?(:edit, @post)
            flash[:danger]
            redirect_to root_path
        end
    end

    def update
        if @post.update post_params
            flash[:dark] = "Post has been updated!"
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        flash[:danger] = "Post has been deleted!"
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def find_post
        @post = Post.find params[:id]
    end

    def authorize
        unless can?(:crud, @idea)
            flash[:danger] = "Not Authorized"
            redirect_to root_path
        end
    end
end
