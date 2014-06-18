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
    Place.create(params["place"])
    # create flash message
    redirect_to :root
  end

  # GET
  def edit
    @place = Place.get(params[:id])
  end

  # PUT
  def update
    params["place"]["specials"].gsub!("\r\n","<br/>")
    params["place"]["notes"].gsub!("\r\n","<br/>")
    # Place.update(params[:id], params["place"])
    # create flash message
    redirect_to :root
  end

  # DELETE
  def destroy
    Place.delete(params[:id])
    # create flash message
    redirect_to :root
  end
end
