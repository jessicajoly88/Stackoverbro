class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to


  end


  def show
    @post = Post.find(params[:id])
  #   # @answers = @post.answers
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
end
