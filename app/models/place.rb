class Place
  def self.all
    keys = $redis.keys("eve:*")
    keys.empty? ? [] : $redis.mget(keys).map { |place| JSON.parse(place) }
  end

  def self.get key
    place = $redis.get("eve:#{key}")
    JSON.parse(place) if place
  end

  def self.create value
    value[:key] = SecureRandom.uuid
    value[:phone] = value[:phone].gsub("(","").gsub(")","").gsub("-","").gsub(" ","") if value[:phone]
    return value[:key] if $redis.set("eve:#{value[:key]}", value.to_json) == "OK"
  end

  def self.update key, value
    return false if value.empty? || value.nil?
    value["key"] = key
    return key if $redis.set("eve:#{key}", value.to_json) == "OK"
  end

  def self.delete key
    return key if $redis.del("eve:#{key}") == 1
  end
end
