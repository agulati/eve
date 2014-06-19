class TagsController < ApplicationController
  http_basic_authenticate_with name: "nicholas", password: "vanderborgh"

  # GET
  def index
    # display flash messages
    @tags = Tag.get
  end

  # PUT
  def create
    tags = {}
    vals = params[:values].reject { |val| val == "" }
    vals.each_with_index do |val, i|
      tags[val] = params[:displays][i]
    end
    Tag.set(tags)
    # create flash message
    redirect_to :tags
  end
end
