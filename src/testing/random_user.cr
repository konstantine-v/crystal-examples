require "http/client"
require "json"

class RandomUserDataApi

  # Use another API, this one is wrapped as an object, I need an array :(
  response = HTTP::Client.get "https://uinames.com/api/"
  # response = HTTP::Client.get "https://icanhazdadjoke.com/slack"
  responseStatus = response.status_code
  body = response.body
  parsed = JSON.parse(body)

  print "HTTP Status: "
  case responseStatus
  when 200..299
    
    print responseStatus
    puts " - It works!"

    print "Name: "
    puts parsed["name"]
    print "Surname: "
    puts parsed["surname"]
    print "Gender: "
    puts parsed["gender"]
    print "Region: "
    puts parsed["region"]

    # pp Array(String).from_json(parsedArr)
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

# The data
# {"name":"Pierre","surname":"Fleury","gender":"male","region":"France"}