class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :fetch_target, only: [:create, :destroy]

  def create
    @target.add_like current_user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @target.unlike current_user
    respond_to do |format|
      format.js
    end
  end

  private


  def fetch_target
    if params[:type] == Settings.like_type.question
      @target = Question.find_by id: params[:target_id]
    elsif params[:type] == Settings.like_type.answer
      @target = Answer.find_by id: params[:target_id]
    end
    unless @target.present?
      flash.now[:message] = I18n.t "error.something_happened"
      respond_to do |format|
        format.js {render "shared/alert"}
      end
    end
  end
end
