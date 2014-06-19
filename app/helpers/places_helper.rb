module PlacesHelper
  def select_tag tag
    if tag == "none"
      return "selected" if ( @place["tags"].nil? || @place["tags"].empty? )
    else
      return "selected" if @place["tags"].include?(tag)
    end
  end
end
