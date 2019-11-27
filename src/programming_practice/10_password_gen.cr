class PasswordGenerator
  # downcase  = ('a'..'z').to_a.sample()
  # upcase    = ('A'..'Z').to_a.sample()
  # nums      = (0..99).to_a.sample()
  # spaces    = ' '

  # how many?
  times = 10

  o = [('a'..'z'), ('A'..'Z')].map(&.to_a).flatten
  string = (0...50).map { o[rand(o.length)] }.join
  puts string

  # while (times > 0)
  #   times = times - 1
  #   varArr = r.rand(1..4)

  #   if varArr = 1
  #     print downcase
  #   elsif varArr = 2
  #     print upcase
  #   elsif varArr = 3
  #     print nums
  #   elsif varArr = 4
  #     print spaces
  #   else
  #     print nums
  #   end

  # end

end
