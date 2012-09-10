# coding: utf-8
require 'string_to_pinyin'
module Iciba
  class Fanyi
    attr_accessor :response, :html, :dir, :result

    

    def initialize(words, dir='auto', bin=false, extended=false, pinyin=false)
      puts '------------------------------------------------------------------------------------' if bin
      # puts if bingit 
      puts wrap_text(words, 40) if words.contains_cjk? && bin
      puts wrap_text(words) unless words.contains_cjk? && bin
      puts '------------------------------------------------------------------------------------' if words.contains_cjk? && bin && pinyin
      puts words.to_pinyin if words.contains_cjk? && bin && pinyin
      puts '------------------------------------------------------------------------------------' if bin
      download_and_parse(words, dir, extended)
      puts wrap_text(self.result) if bin
      puts self.result.to_pinyin if self.result.contains_cjk? && bin
      puts '------------------------------------------------------------------------------------' if bin
      return self.result
    end
    
    def wrap_text(txt, col = 80)
      txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
        "\\1\\3\n") 
    end
    
    def self.check_char(str)
      str.contains_cjk?
    end
    
    def print_pinyin(words)
      puts words.string_to_pinyin
    end
    
    def self.print_pinyin(words)
      puts words.string_to_pinyin
    end
  
  
    def download_and_parse(words, dir, extended)
      self.response = Iciba::Tools.parse(Iciba::Tools.post('http://fy.iciba.com/api.php', {:q => words, :type => dir}).body_str)
      self.html = self.response.ret.force_encoding("UTF-8")
      self.result = (Iciba::Tools.doc(self.html)/'span.dd').text.strip
      self.result = self.html if self.result == ""
      self.result = self.result.split('，')[0] if self.result.include?('，') unless extended
      self.result = self.result.split('；')[0] if self.result.include?('；') unless extended
    end
  end
end