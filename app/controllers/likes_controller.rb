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
    case params[:type]
    when Settings.questions
      @target = Question.find_by id: params[:target_id]
    when Settings.answer
      @target = Answer.find_by id: params[:target_id]
    else
      show_error
    end
    return if @target.present?
    show_error
  end

  def show_error
    flash.now[:message] = I18n.t "error.something_happened"
    respond_to do |format|
      format.js{render "shared/alert"}
    end
  end
end
