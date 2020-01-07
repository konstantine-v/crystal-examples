class RandNum
  def fromZero(n=1)
    rand_nums = (1..n).map{rand(0..9)}
    rand_nums.join("")
  end
  def fromOne(n=1)
    rand_nums = (1..n).map{rand(1..9)}
    rand_nums.join("")
  end
end

# RandNum.new.fromZero 7 => eg. 6425020 (6-digit random string, can contain zeros)
# RandNum.new.fromOne 7 => eg. 6425725 (6-digit random string, wont contain zeros)

