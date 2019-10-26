# Hangman - crappy, close, going to improve to actually get the correct turns amnt
possibleWords = ["Hangy", "Mingo", "Funny", "Deadman", "Skunky"]
randWord = possibleWords.sample
theWordArr = randWord.split("").map(&.to_s)
puts theWordArr

theWordArr.each() do |i|
  guess = gets.to_s
  g = guess.split("").map(&.to_s)
  if (g.size < 2)
    puts "You guessed:", theWordArr & g
  else
    puts "Wrong"
  end
end
