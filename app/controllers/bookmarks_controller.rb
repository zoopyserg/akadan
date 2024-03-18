class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record
  before_action :set_bookmark
  before_action :set_back_path
  before_action :redirect_to_records_path, only: :create_bookmark, if: :bookmark_present?

  # POST /bookmarks or /bookmarks.json
  def create_bookmark
    @bookmark = current_user.bookmarks.new
    @bookmark.record = @record

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @back_path, notice: "Bookmark was successfully created." }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { redirect_to @back_path, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy_bookmark
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @back_path, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def redirect_to_records_path
    redirect_to records_path
  end

  def set_back_path
    @back_path = request.referrer.present? ? request.referrer : records_path
  end

  def bookmark_present?
    @bookmark.present?
  end

  def set_bookmark
    @bookmark = current_user.bookmarks.find_by(record: @record)
  end

  def set_record
    @record = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:record_id]) if params[:record_id].present?
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:record_id)
  end
end
