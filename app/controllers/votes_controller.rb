class VotesController < ApplicationController
  before_action :set_comment

  # POST /votes or /votes.json
  def create
    if !user_signed_in?
      render 'shared/redirect_to_login'
      return
    end

    if @comment.votes.where(user: current_user, vote_flag: params[:vote_flag]).exists?
      render json: {
        success: false,
        message: 'You have already voted on this comment.'
      }
      return
    end

    @user_voted_opposite = false
    if @comment.votes.where(user: current_user, vote_flag: !vote_flag).exists?
      @user_voted_opposite = true
      @comment.votes.where(user: current_user, vote_flag: !vote_flag).destroy_all
    end

    @vote = @comment.votes.new
    @vote.vote_flag = vote_flag
    @vote.user = current_user

    respond_to do |format|
      if @vote.save
        format.js do
          if @vote.vote_flag
            render :up
          else
            render :down
          end
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  # Only allow a list of trusted parameters through.
  def vote_flag
    ActiveModel::Type::Boolean.new.cast params[:vote_flag]
  end
end
