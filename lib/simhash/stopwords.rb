# -*- encoding : utf-8 -*-
require File.join(File.dirname(__FILE__), "stopwords", "en")
require File.join(File.dirname(__FILE__), "stopwords", "ru")
require File.join(File.dirname(__FILE__), "stopwords", "zh")

module Simhash
  module Stopwords
    ALL = RU + EN + ZH
  end
end
