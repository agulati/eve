class PlacesController < ApplicationController
  http_basic_authenticate_with name: "nicholas", password: "vanderborgh"

  # GET
  def index
    # display flash messages
    @places = Place.all
  end

  # GET
  def new
    @place = {}
  end

  # POST
  def create
    Place.create(params["place"])
    # create flash message
    render :index
  end

  # GET
  def edit
    @place = Place.get(params[:id])
  end

  # PUT
  def update
    Place.update(params["key"], params["place"])
    # create flash message
    render :index
  end

  # DELETE
  def destroy
    Place.delete(params[:id])
    # create flash message
    render :index
  end
end
