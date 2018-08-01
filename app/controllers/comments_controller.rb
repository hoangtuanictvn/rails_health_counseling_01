class CommentsController < ApplicationController
  def create
    if logged_in?
      @comment = Answer.new comment_params
      if @comment.save
        respond_to do |format|
          format.js
        end
      else
        flash[:warning] = t ".unsucess"
      end
    else
      flash[:warning] = t "global.message.please_login_to_comment"
    end
  end

  def edit
    if logged_in?
      @rawcomment = Answer.find_by id: params[:id]
      if !@rawcomment.nil?
        respond_to do |format|
          format.js
        end
      else
        flash[:warning] = t ".unsucess"
      end
    else
      flash[:warning] = t "global.message.please_login_to_edit_comment"
    end
  end

  def update
    @rawcomment = Answer.find_by id: params[:id]
    if logged_in?
      if @rawcomment.update_attributes content: params[:comments][:content]
        respond_to do |format|
          format.js
        end
      else
        flash[:warning] = t ".unsucess"
      end
    else
      flash[:warning] = t "global.message.please_login_to_delete"
    end
  end

  def destroy
    if logged_in?
      @comment = Answer.find_by id: params[:id]
      if @comment.delete
        respond_to do |format|
          format.js
        end
      else
        flash[:warning] = t ".unsucess"
      end
    else
      flash[:warning] = t "global.message.please_login_to_delete"
    end
  end

  private
  def comment_params
    params.require(:comments)
          .permit :content, :user_id, :question_id
  end
end
