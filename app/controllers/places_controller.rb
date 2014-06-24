class PlacesController < ApplicationController
  http_basic_authenticate_with name: "nicholas", password: "vanderborgh"

  # GET
  def index
    # display flash messages
    @places = Place.all.sort { |a,b| a["name"] <=> b["name"] }
  end

  # GET
  def new
    @place = {}
  end

  # POST
  def create
    format_as_html(params)
    Place.create(params["place"])
    # create flash message
    redirect_to :root
  end

  # GET
  def edit
    p format_as_text(Place.get(params[:id]))
    @place = format_as_text(Place.get(params[:id]))
    @tags = Tag.get
  end

  # PUT
  def update
    format_as_html(params)
    Place.update(params[:id], params["place"])
    # create flash message
    redirect_to :root
  end

  # DELETE
  def destroy
    Place.delete(params[:id])
    # create flash message
    redirect_to :root
  end

  private

  def format_as_text place
    place["specials"].gsub!("<br/>", "\r\n") if place["specials"]
    place["notes"].gsub!("<br/>", "\r\n") if place["notes"]
    place["tags"] = "none" if place["tags"].empty?
    place
  end

  def format_as_html params
    params["place"]["specials"].gsub!("\r\n","<br/>")
    params["place"]["notes"].gsub!("\r\n","<br/>")
    params["place"]["tags"] = [] if params["place"]["tags"].include?("none")
  end
end
