# -*- encoding : utf-8 -*-
module Simhash
  module Stopwords
    ZH ||= File.read(File.join(File.dirname(__FILE__), 'chinese_stopword.txt'), :encoding =>'UTF-8').gsub(/\r\n/, ' ')
  end
end
