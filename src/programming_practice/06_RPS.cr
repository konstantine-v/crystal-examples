# Rock Paper Scissors
puts "Type Rock, Paper, or Scissors"
print "Your Hand: "
p_hand = gets.to_s

rps_arr = ["Rock", "Paper", "Scissors"]

# Sanitize Input
# case p_hand
# when "rock" || "rack" || "Rack" || "rck" || "Rck"
  # p_hand = rps_arr[0]
  # puts "Corrected to: " + rps_arr[0]
# when "paper" || "papr" || "ppr" || "Papr" || "Ppr"
   # p_hand = rps_arr[1]
  # puts "Corrected to: " + rps_arr[1]
# when "scissors" || "scisors" || "Scisors" || "sciscors" || "sissors" || "Sissors"
  # p_hand = rps_arr[2]
  # puts "Corrected to: " + rps_arr[2]
# end

if(p_hand == "rock" || "rack" || "Rack" || "rck" || "Rck")
  p_hand = rps_arr[0]
  puts "Corrected to: " + rps_arr[0]
elsif(p_hand == "paper" || "papr" || "ppr" || "Papr" || "Ppr")
  p_hand = rps_arr[1]
  puts "Corrected to: " + rps_arr[1]
elsif(p_hand == "scissors" || "scisors" || "Scisors" || "sciscors" || "sissors" || "Sissors")
  p_hand = rps_arr[2]
  puts "Corrected to: " + rps_arr[2]
elsif(p_hand != rps_arr[0] || rps_arr[1] || rps_arr[3])
  puts "error"
  exit
end

cpu_hand = rps_arr.sample
puts "CPU's Hand: " + cpu_hand
if (cpu_hand == p_hand)
  puts "Tie!"
elsif (cpu_hand == rps_arr[0] && p_hand == rps_arr[2] ||
       cpu_hand == rps_arr[1] && p_hand == rps_arr[0] ||
       cpu_hand == rps_arr[2] && p_hand == rps_arr[1])
  puts "CPU Beat You!"
elsif (cpu_hand == rps_arr[0] && p_hand == rps_arr[1] ||
       cpu_hand == rps_arr[1] && p_hand == rps_arr[2] ||
       cpu_hand == rps_arr[2] && p_hand == rps_arr[0])
  puts "You Win!"
else
  puts "error"
end
