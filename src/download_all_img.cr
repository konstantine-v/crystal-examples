VERSION = "0.1.2"

require "admiral"
require "http/client"

class ImgDownload < Admiral::Command
  define_version VERSION
  define_help description: "A command that Downloads all images in a thread."
  define_flag url : String,
    default: "https://a.4cdn.org/g/thread/73651878.json",
    description: "The Url to the Json that you want to parse for images.",
    long: url
  define_flag dirname : String,
    default: "pics",
    description: "The name of the downloaded directory.",
    long: dirname
  define_flag file : String,
    default: "site.html",
    description: "The name of the downloaded directory.",
    long: file

  def run
    # HTTP::Client.get("#{flags.url}") do |response|
    # File.write("example.com.html", response.body_io)
    # end

    # cmd1 = %{curl '#{flags.url}' | jq -r '.posts[] | "https://i.4cdn.org/g/"; + (.tim|tostring) + .ext' | grep -v null$ | xargs wget}
    # Process.run(cmd1)

    # TODO: Check http response not the url
    if (flags.url != nil)
      # Todo: Stop using shell commands and start using Crystal lang things
      setup1 = %{echo 'Creating directory for your images called #{flags.dirname}...' && mkdir #{flags.dirname} && echo 'Moving into new directory...' && cd #{flags.dirname}}
      cmd1 = %{curl '#{flags.url}' | jq -r '.posts[] | "https://i.4cdn.org/g/"; + (.tim|tostring) + .ext' | grep -v null$ | xargs wget}
      Process.run(setup1)
      Process.run(cmd1)
      # if (File.empty?("#{flags.file}") === true)
      #   File.read()
      # else
      #   puts "error, nothing in html"
      #   exit
      # end
    else
      puts "error, your url returned nil"
    end

    # command = "curl http://dist.crystal-lang.org/apt/setup.sh | bash"
    # write = File.write("example.com.html", output)
    # Process.run(command, shell: true, output: write)
    # output = write.to_s

    # Process.run("sh", {"-c", command}, output: io)
  end
end

ImgDownload.run
