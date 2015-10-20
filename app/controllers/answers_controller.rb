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

  def edit
    @post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
    if current_user
      if @answer.user_id == current_user.id
        if @answer.update(answer_params)
          redirect_to post_path(@answer.post)
        else
          render :edit
        end
      else
        flash[:alert] = "You cannot edit an answer if you didn't write it"
        redirect_to post_path
      end
    else
      flash[:alert] = "You must be signed in to edit a post"
      redirect_to post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])

      if current_user
        if @answer.user_id == current_user.id
          @answer.destroy
          redirect_to post_path(@post)
        else
          flash[:alert] = "You cannot delete an answer if you didn't write it"
          redirect_to post_path(@post)
        end
      else
        flash[:alert] = "You must be signed in to delete an answer"
        redirect_to posts_path
      end
  end


  private

  def answer_params
    params.require(:answer).permit(:content)
  end


end
