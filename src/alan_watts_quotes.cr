require "sqlite3"

# Put instructions to get the db with wget or something
class Quotes
  DB.open "sqlite3://./lib/quotes.db" do |db|
    puts "Quotes:"
    db.query "select AuthorName, QuoteText from Authors as a inner join Quotes as b on a.AuthorId = b.AuthorId order by AuthorName" do |rs|
      puts "#{rs.column_name(0)} - #{rs.column_name(1)}"
      # => AuthorName - QuoteText
      rs.each do
        puts "#{rs.read(String)} - '#{rs.read(String)}'"
      end
    end
  end

end

# Add Admiral shard to make this so much better. Maybe do that in a seperate project and include db.