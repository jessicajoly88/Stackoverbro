class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to post_path(@post)
      else
        render :new
      end
    else
      flash[:alert] = "You must be logged in to create a post!"
      redirect_to posts_path
    end
  end


  def show
    @post = Post.find(params[:id])

  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
