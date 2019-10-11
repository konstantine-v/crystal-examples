require "http/client"
require "json"
require "admiral"

class Quotes < Admiral::Command
  define_help description: "A command that returns a quote"
  define_argument category : String,
    default: "ability",
    description: "Put the author you want to recieve quotes from, for example 'alan-watts' would be input with a '-' not a space."

  def run
    response = HTTP::Client.get "https://raw.githubusercontent.com/btford/philosobot/master/quotes/#{arguments.category}.json"
    responseStatus = response.status_code
    body = response.body
    parsed = JSON.parse(body)

    print "HTTP Status: "
    case responseStatus
    when 200..299
      print responseStatus
      puts " - It works!"
      puts parsed["topic"]
      print "Name: "
      puts parsed["name"]
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
end

Quotes.run
