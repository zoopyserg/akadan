class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_record

  before_action :set_bookmark, only: %i[ destroy ]

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = current_user.bookmarks.new
    @bookmark.record = @record

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to records_path, notice: "Bookmark was successfully created." }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { redirect_to records_path, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to records_path, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = current_user.bookmarks.find_by(record: @record, id: params[:id])
  end

  def set_record
    @record = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:record_id]) if params[:record_id].present?
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:record_id)
  end
end
