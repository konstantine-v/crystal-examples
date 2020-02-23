class PasswordGenerator
  # downcase  = ('a'..'z').to_a.sample()
  # upcase    = ('A'..'Z').to_a.sample()
  # nums      = (0..99).to_a.sample()
  # spaces    = ' '

  # Hown long to generate password?
  print "How characters long do you want you password? "
  chars = 10
  chars = gets.to_s.to_i32
  if (chars == nil || "")
    chars = 10
  end

  o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&.to_a).flatten
  string = (0..chars).map { o[rand(o.size)] }.join
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
