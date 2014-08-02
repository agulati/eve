class TagsController < ApplicationController
  http_basic_authenticate_with name: "nicholas", password: "vanderborgh"

  # GET
  def index
    # display flash messages
    @tags = Tag.get
    p @tags
  end

  # PUT
  def create
    # create flash message
    Tag.set(params["tags"].reject { |t| t["order"].blank? || t["value"].blank? || t["display"].blank?})
    redirect_to :tags
  end
end
