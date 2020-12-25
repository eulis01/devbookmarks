class BookmarksController < ApplicationController
  before_action :set_bookmark, :verified_user, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1
  def show
    @bookmark = Bookmark.find_by(id: params[:id])
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        redirect_to @bookmark, notice: 'Bookmark was successfully created.' 
      else
        render 'form'
      end
  end

  # PATCH/PUT /bookmarks/1

  def update

  end

  # DELETE /bookmarks/1

  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :tag_id)
    end
end
