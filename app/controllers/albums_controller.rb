class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :show, :update, :destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create 
    @album = Album.new(params_album)
    if @album.save
      flash[:success] = "Great! Your album was created successfully"
      redirect_to root_path
    else
      flash[:error] = "Sorry! There was something wrong with your album."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @album.update(params_album)
      redirect_to root_path, notice: "Update Success"
    else
      render 'edit', notice: "There was something wrong"
    end
  end

  def destroy
    @album.destroy
    redirect_to root_path, notice: "Delete Success"
  end

  def show
  end

  private
  def params_album
    params.require(:album).permit(:title, :description, :photo, :date)
  end

  def set_album
    @album = Album.find(params[:id])
  end
end
