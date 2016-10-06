class Api::V1::Deserializer
  def jsonapi_parse(location)
    json_string = "#{location[:name]} #{location[:latitude]} #{location[:longitude]}"
    return JSON.parse(json_string)
  end
end
