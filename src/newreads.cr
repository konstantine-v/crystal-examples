require "./newreads/**"

# This is an app that will create a random valid ISBN to then get the title and info for it, maybe some links.
# NewReads as in New Book to read when I decide.

module NewReads
  VERSION = "0.0.2"

  # Generate the Random ISBN
  ISBN = NewReads::Generate.english
  puts "New ISBN: " + ISBN

  # Check the ISBN
  # NewReads::Generate.isLegal(ISBN)

  # If true do the request
  # NewReads::Request.
  # if not dont, break for whatever reason

end
