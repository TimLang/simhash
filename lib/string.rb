# -*- encoding : utf-8 -*-

require 'rmmseg'
require 'tyccl'
require 'debugger'

class String
  include RMMSeg
  RMMSeg::Dictionary.load_dictionaries

  def simhash(options={})
    Simhash.hash(self.segment, options)
  end
  
  def hash_vl_rb(length)
    return 0 if self == ""

    x = self.bytes.first << 7
    m = 1000003
    mask = (1<<length) - 1
    self.each_byte{ |char| x = ((x * m) ^ char.to_i) & mask }

    x ^= self.bytes.count
    x = -2 if x == -1
    x
  end

  def segment
    algor = RMMSeg::Algorithm.new(self)
    result = []
    loop do
      tok = algor.next_token
      word = (Tyccl.get_similar(tok.text.force_encoding('utf-8')).first.first rescue nil)
      word = tok.text if word.nil? && !tok.nil?
      break if word.nil?
      result << word
    end
    result
   end

end
