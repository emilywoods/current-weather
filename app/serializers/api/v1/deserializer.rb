def jsonapi_parse(location)
  ActiveModelSerializers::Deserialization.jsonapi_parse(location)
end

def jsonapi_parse!(location)
  ActiveModelSerializers::Deserialization.jsonapi_parse!(location)
end
