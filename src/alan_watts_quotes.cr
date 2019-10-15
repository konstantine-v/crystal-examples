require "sqlite3"

class Quotes
  DB.open "sqlite3://./data/quotes.db" do |db|
    # db in data directory
    puts "Quotes:"
    db.query "select AuthorName, QuoteText from Authors as a inner join Quotes as b on a.AuthorId = b.AuthorId order by random() limit 1" do |data|
      data.each do
        puts "#{data.read(String)} - '#{data.read(String)}'"
      end
    end
    

  end
end
