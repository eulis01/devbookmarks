class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to @tag, notice: 'Tag was successfully created.' 
      else
        render 'form'
      end
  end

  # PATCH/PUT /tags/1
  def update

  end

  # DELETE /tags/1
  def destroy
    @tag.destroy :id
    redirect_to tags_url, notice: 'Tag was successfully destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name, :color, :user_id, :bookmark_id)
    end
end
