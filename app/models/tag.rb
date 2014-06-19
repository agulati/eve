class Tag
  def self.get
    tags = $redis.get("eve:tags")
    !!tags ? JSON.parse(tags) : []
    # []
  end

  def self.update tags
    return false if tags.nil? || tags.empty?
    return tags.length if $redis.set("eve:tags", tags.to_json) == "OK"
  end
end
