class PhotosController < ApplicationController
  def index
    @photo_of_the_day = Photo.last || Photo.new
  end

  def new
    @photo = Photo.new
  end

  def create
    gcloud = Google::Cloud.new(ENV['GOOGLE_CLOUD_KEYFILE_JSON'])
    storage = gcloud.storage
    bucket = storage.bucket 'photo-of-the-day'
    file_url = params[:photo][:photo].tempfile.path
    bucket.create_file file_url, Time.now.getutc.to_s

    @photo = Photo.new
    @photo.title = params[:photo][:title]
    @photo.caption = params[:photo][:caption]
    @photo.date = Date.new(dates[2].to_i, dates[0].to_i, dates[1].to_i)
    @photo.photo = params[:photo][:photo]
    @photo.save
    if @photo
      redirect_to photos_path
    end
  end

  def dates
    params[:photo][:date].split("/")
  end
end
