# Rock Paper Scissors
rpsVals = [ "Rock", "Paper", "Scissors" ]

cpuHand = rpsVals.sample()
puts "Rock, Paper, or Scissors"
yourHand = gets.to_s

puts cpuHand
if (cpuHand == yourHand )
  puts "Tie!"
elsif ( cpuHand == rpsVals[0] && yourHand == rpsVals[2] || 
        cpuHand == rpsVals[1] && yourHand == rpsVals[0] || 
        cpuHand == rpsVals[2] && yourHand == rpsVals[1] )
  puts "CPU Beat You!"
elsif ( cpuHand == rpsVals[0] && yourHand == rpsVals[1] || 
        cpuHand == rpsVals[1] && yourHand == rpsVals[2] || 
        cpuHand == rpsVals[2] && yourHand == rpsVals[0] )
  puts "You Win!"
else
  puts "error"
end
