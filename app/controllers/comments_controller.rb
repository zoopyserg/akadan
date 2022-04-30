class CommentsController < ApplicationController
  protect_from_forgery except: :new
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_commentable, only: [:create, :new]

  # GET /comments/new
  def new
    @comment = @commentable.comments.new

    respond_to do |format|
      format.js do
        if current_user
          render 'new'
        else
          render 'shared/redirect_to_login'
        end
      end
    end
  end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        # todo: redirect to record even if it's a reply
        format.html { redirect_to @commentable, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
        format.js { render :show }
      else
        format.html { render :new, status: :unprocessable_entity, record: @commentable }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js { render :show }
      end
    end
  end

  private
  def set_commentable
    if params[:record_id]
      @commentable = Record.find(params[:record_id])
    elsif params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    end
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
