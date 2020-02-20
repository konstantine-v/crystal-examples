class Lottery
  @numbers : Array(Int32)

  def initialize
    @numbers = (1..49).to_a
  end

  def pick(n = 1)
    @numbers.sample(n).sort
  end

  def pick_winner
    puts "The winning numbers are:"
    puts pick(6).join "\t"
    puts "And the powerball is: #{pick}"
  end
end

game = Lottery.new
game.pick(6)
game.pick(6)
game.pick_winner
