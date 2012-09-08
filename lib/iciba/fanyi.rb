# coding: utf-8
module Iciba
  class Fanyi
    attr_accessor :response, :html, :dir, :result

    def initialize(words, dir='auto', bin=false)
      puts '-------------------------------------------------' if bin
      puts words
      puts '-------------------------------------------------' if bin
      download_and_parse(words, dir)
      self.result.each_line {|l| puts l} if bin
      puts '-------------------------------------------------' if bin
      return self.result
    end
  
  
    def download_and_parse(words, dir)
      self.response = Tools.parse(Tools.post('http://fy.iciba.com/api.php', {:q => words, :type => dir}).body_str)
      self.html = self.response.ret
      self.result = (Tools.doc(self.html)/'span.dd').text.strip
      self.result = self.html if self.result == ""
    end
  end
end