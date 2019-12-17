require "crystagiri"
require "admiral"
require "file_utils"

class GetImages < Admiral::Command
  define_argument url : String, 
    description: "This is the url you want to get the images from.",
    default: "https://google.com/",
    required: true
  define_flag type : String, 
    description: "This will allow you to consume different dat types (eg. HTML, JSON, XML)",
    default: "html"

  def run

    if (flags.type === "xml")
      #Todo: Add XML support
    elsif (flags.type === "json")
      #Todo: Add JSON support
    elsif (flags.type === "html")
      FileUtils.mkdir("your_images")
      FileUtils.cd("your_images")
      doc = Crystagiri::HTML.from_url "#{arguments.url}"
      puts "Downloading Images..."
      result = doc.where_tag("img") { |tag| 
        # puts tag.node["src"]
        # puts "test"
        HTTP::Client.get(tag.node["src"]) do |response|
          name = (response.hash).to_s + ".jpg"
          File.write(name, response.body_io)
        end 
      }
      puts "Finished!"
    else
      puts "No type declared"
    end
    

  end

end

GetImages.run
