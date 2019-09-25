require "http/client"
require "json"

class Testing::Jokes

  response = HTTP::Client.get "https://icanhazdadjoke.com/slack"
  responseStatus = response.status_code
  body = response.body.lines.first

  if responseStatus = "200"
    print responseStatus
    puts " - It works!"
    parsed = JSON.parse(body)
    puts parsed["attachments"]

  elsif responseStatus = "404"
    print responseStatus
    puts " - Not found"
  else
    print responseStatus
    puts " - Not sure what happened, check the url"
  end

end



