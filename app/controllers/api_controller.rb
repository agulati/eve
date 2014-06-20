class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def places
    @places = Place.all.sort { |a,b| a["name"] <=> b["name"] }
    @places.select! { |place| place["tags"] && place["tags"].include?(params[:tag]) } if params[:tag]
    render :json => @places
  end

  def tags
    render :json => Tag.get
  end

end
