class VideosController < ApplicationController
  respond_to(:html)

  def index
    respond_with @videos = Video.all
  end

  def new
    @video = Video.new
    respond_with(@video)
  end

  def create
    respond_with @video = Video.create(video_params)
  end

  private

  def video_params
    params.require(:video).permit(:title, :category, :location)
  end
end
