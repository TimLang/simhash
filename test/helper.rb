# -*- encoding : utf-8 -*-

$: << File.join(File.dirname(__FILE__), '../lib')

require "simhash"
require "string"
require "integer"
begin
  require "string_hashing" 
rescue LoadError
  nil
end

a1 = "Sometimes you might need longer simhash (finding similarity for very long strings is a good example)."
a2 = "你妈妈叫你回家吃饭哦，回家罗回家哦"
def similarity a, b
  if a.to_f > b.to_f
    b.to_f / (a.to_f)
  else
    a.to_f / (b.to_f)
  end
end

hash1 = a1.simhash(:hashbits => 64)
hash2 = a2.simhash(:hashbits => 64)

puts (hash1 ^ hash2).to_s(2).count("1")
puts hash1.to_s(2)
puts hash2.to_s(2)
puts hash1.hamming_distance_to(hash2)
puts similarity(hash1, hash2)

