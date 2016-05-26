class VideosController < ApplicationController
  respond_to(:html)

  def index
    respond_with @videos = Video.all
  end

  def show
    respond_with @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
    respond_with(@video)
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:notice] = 'Video successfully uploaded.'
    end
    respond_with @video = Video.create(video_params)
  end

  private

  def video_params
    params.require(:video).permit(:title, :category, :location)
  end
end
