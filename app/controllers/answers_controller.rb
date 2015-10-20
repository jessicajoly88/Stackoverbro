class AnswersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @answer = @post.answers.new
  end

  def create
    if current_user
      @post = Post.find(params[:post_id])
      @answer = @post.answers.new(answer_params)
      @answer.user = current_user
      if @answer.save
         redirect_to post_path(@post)
      else
        render :new
      end
    else
      flash[:alert] = "You must be logged in to reply to a post!"
      redirect_to posts_path
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:content)
  end


end
