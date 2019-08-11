class PicturesController < ApplicationController
before_action :set_picture, only: [:show, :edit, :update, :destroy]


  def index
    @picture = Picture.all
  end

  def show
    #@pictures = Picture.find(params[:id])
  end

  # GET /users/new
  def new
    @picture = Picture.news
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @picture = current_user.pictures.build(picture_params)

    # respond_to do |format|
    #binding.pry
      if @pictuer.save
        redirect_to user_path(@picture), notice: '投稿完了'
      else
        render 'confirm'
      end
  end

  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  def update
    if @picture.update(picture_params)
        redirect_to pictures_path, notice: '編集完了'
    else
        redirect_to edit_picture_path
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @picture.destroy
    redirect_to picture_path, notice: '削除完了'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:picture).permit(:image, :caption)
    end
end
