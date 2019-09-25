require "http/client"
require "json"

class Testing::Jokes

  response = HTTP::Client.get "https://icanhazdadjoke.com/slack"
  responseStatus = response.status_code
  body = response.body
  parsed = JSON.parse(body)
  parsedArr = parsed["attachments"]
  # parsedStr = JSON.stringify(body)

  case responseStatus
  when 200..299
    print responseStatus
    puts " - It works!"
    pp Array(String).from_json(body)
  when 400..499
    puts "400: Server Not Found"
  when 500
    puts "500: Internal Server Error"
  when 502
    puts "502: Bad Gateway"
  when 503
    puts "503: Service Unavailable"
  when 504
    puts "504: Gateway Timeout"
  else
    puts "Server returned error #{responseStatus}"
  end

end


# The Data I'm consuming looks like:
# {
#   "attachments": [
#     {
#       "fallback": "What kind of magic do cows believe in? MOODOO.",
#       "footer": " - ",
#       "text": "What kind of magic do cows believe in? MOODOO."
#     }
#   ],
#   "response_type": "in_channel",
#   "username": "icanhazdadjoke"
# }



# module JokesApi

#   class Joke
#     JSON.mapping({
#       text: String
#     })
#   end



# Misc Code

#   class ServerError < Exception; end
#   Host = "maps.googleapis.com"
 
#     def initialize
#       @http_client = HTTP::Client.new(Host, ssl: true)
#     end

#     de
#       response = @http_client.get("/maps/api/geocode/json?address=#{location}")
#       process_response(response)
#     end

#     private def process_response(response : HTTP::Client::Response)
#       case response.status_code
#       when 200..299
#         return SuccessResponse.from_json(response.body) \
#           if ["OK", "ZERO_RESULTS"].includes?(Response.from_json(response.body).status)
#         raise Client::ServerError.new(ErrorResponse.from_json(response.body).error_message)
#       when 400
#         raise Client::ServerError.new("400: Server Not Found")
#       when 500
#         raise Client::ServerError.new("500: Internal Server Error")
#       when 502
#         raise Client::ServerError.new("502: Bad Gateway")
#       when 503
#         raise Client::ServerError.new("503: Service Unavailable")
#       when 504
#         raise Client::ServerError.new("504: Gateway Timeout")
#       else
#         raise Client::ServerError.new("Server returned error #{response.status_code}")
#       end
#     end

# end