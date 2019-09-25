require "onyx/http"

class Testing::OnyxServer
  
  Onyx::HTTP.get "/" do |env|
    env.response << "Hello, world!"
  end
  Onyx::HTTP.listen

end