class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if current_user
        if @post.user_id == current_user.id
          if @post.update(post_params)
            redirect_to post_path(@post)
          else
            render :edit
          end
        else
          flash[:alert] = "You Cannot Edit A Post If You Didn't Write It"
          redirect_to post_path
        end
      else
        flash[:alert] = "You must be signed in to edit a post"
        redirect_to posts_path
      end
  end

  def destroy
    @post = Post.find(params[:id])
      if current_user
        if @post.user_id == current_user.id
          @post.destroy
        else
          flash[:alert] = "You Cannot Delete A Post If You Didn't Write It"
          redirect_to post_path
        end
      else
        flash[:alert] = "You must be signed in to edit a post"
        redirect_to posts_path
      end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
