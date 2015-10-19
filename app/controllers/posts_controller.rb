class PostsController < ApplicationController
  def index
    @posts = Post.all
  end


  def show
    @post = Post.find(params[:id])
  #   # @answers = @post.answers
  end

end
