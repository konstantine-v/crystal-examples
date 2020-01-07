require "halite"
require "json"

# Break this out into it's own app, seperate from the ISBN search thing. They're two seperate apps that can work together

# A 13-digit ISBN looks like 978-3-16-148410-0
# Searching for an eglish book means that that isbn would be 978-1 or 978-0
# For example, 978-0307741202 is used for The Wisdom of Insecurity, by Alan Watts

# LANG_EN = [ "English" => [ "978-0", "978-1"] ], how to created nested array proper?
# The idea for that would be that you specify the key (Language) and then it'll shuffle that array.

# Set proper Types and switch types correctly.
# format ISBN with "-" notation and then regex to query

module NewReads::Generate

  def to_hex(int)
    int < 16 ? '0' + int.to_s(16) : int.to_s(16)
  end

  def rand_num(n)
    Random.new.rand(1..9).to_s.each(n)
  end
  LANG = "9780"
  def self.english
    rand_byte = Random.new.rand(999).to_s(3)
    rand_byte_one = Random.new.rand(1..9).to_s
    if (LANG === "9780")
      digit_codes = Random.new.rand(1..6)
      if digit_codes === 6
        rand_byte = Random.new.rand(9999999).to_s 
        reg_element = rand_byte + rand_byte + rand_byte + rand_byte + rand_byte + rand_byte + rand_byte
        reg_group = Random.new.rand(1).to_s + rand_byte
        reg_group = reg_group + reg_element

      elsif digit_codes === 5
        reg_element = rand_byte + rand_byte + rand_byte + rand_byte + rand_byte + rand_byte
        reg_group_rand = [200..227, 229..368, 370..638, 640..647, 649..654, 656..699].sample()
        reg_group = Random.new.rand(reg_group_rand).to_s
        reg_group = reg_group + reg_element

      elsif digit_codes === 4
        reg_element = rand_byte + rand_byte + rand_byte + rand_byte + rand_byte
        reg_group_rand = [2280..2289, 3690..3699, 6390..6398, 6550..6559, 7000..8499].sample()
        reg_group = Random.new.rand(reg_group_rand).to_s
        reg_group = reg_group + reg_element

      elsif digit_codes === 3
        reg_element = rand_byte + rand_byte + rand_byte + rand_byte
        reg_group = Random.new.rand(85000..89999).to_s
        reg_group = reg_group + reg_element

      elsif digit_codes === 2
        reg_element = rand_byte + rand_byte + rand_byte
        reg_group = Random.new.rand(900000..949999).to_s
        reg_group = reg_group + reg_element

      elsif digit_codes === 1
        reg_element = rand_byte + rand_byte
        reg_group_rand = [6399000..6399999, 6480000..6489999, 9500000..9999999].sample()
        reg_group = Random.new.rand(reg_group_rand).to_s
        reg_group = reg_group + reg_element
      end
    end

    # if (LANG === "9781")
    #   digit_codes = Random.new.rand(5..6)
    #   if digit_codes === 6
    #     reg_group = "00" + Random.new.rand(9999999).to_s

    #     1-01-xxxxxx-x 	1-06-xxxxxx-x

    #   elsif digit_codes === 5
    #     reg_element = Random.new.rand(999999).to_s
    #     reg_group_rand = [200..227, 229..368, 370..638, 640..647, 649..654, 656..699].sample()
    #     reg_group = Random.new.rand(reg_group_rand).to_s
    #     reg_group = reg_group + reg_element

    #   elsif digit_codes === 4
    #     reg_element = Random.new.rand(99999).to_s
    #     reg_group_rand = [2280..2289, 3690..3699, 6390..6398, 6550..6559, 7000..8499].sample()
    #     reg_group = Random.new.rand(reg_group_rand).to_s
    #     reg_group = reg_group + reg_element

    #   elsif digit_codes === 3
    #     reg_element = Random.new.rand(9999).to_s
    #     reg_group = Random.new.rand(85000..89999).to_s
    #     reg_group = reg_group + reg_element

    #   elsif digit_codes === 2
    #     reg_element = Random.new.rand(999).to_s
    #     reg_group = Random.new.rand(900000..949999).to_s
    #     reg_group = reg_group + reg_element

    #   elsif digit_codes === 1
    #     reg_element = Random.new.rand(99).to_s
    #     reg_group_rand = [6399000..6399999, 6480000..6489999, 9500000..9999999].sample()
    #     reg_group = Random.new.rand(reg_group_rand).to_s
    #     reg_group = reg_group + reg_element
    #   end
    # end

    # puts "New ISBN: " + LANG + reg_group.to_s
    return LANG + reg_group.to_s

  end

end