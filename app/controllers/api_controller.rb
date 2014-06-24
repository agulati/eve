class ApiController < ApplicationController
  before_filter :set_access_control_headers

  def places
    @places = Place.all.sort { |a,b| a["name"] <=> b["name"] }
    @places.select! { |place| place["tags"] && place["tags"].include?(params[:tag]) } if params[:tag]
    render :json => @places
  end

  def tags
    tags = Tag.get
    p tags
    render :json => tags
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

end
