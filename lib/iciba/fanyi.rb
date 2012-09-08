# coding: utf-8
module Iciba
  class Fanyi
    attr_accessor :response, :html, :dir, :result

    

    def initialize(words, dir='auto', bin=false, extended=false)
      puts '------------------------------------------------------------------------------------' if bin
      # puts if bingit 
      puts wrap_text(words, 40)
      puts '------------------------------------------------------------------------------------' if bin
      download_and_parse(words, dir, extended)
      puts wrap_text(self.result) if bin
      puts '------------------------------------------------------------------------------------' if bin
      return self.result
    end
    
    def wrap_text(txt, col = 80)
      txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
        "\\1\\3\n") 
    end
  
  
    def download_and_parse(words, dir, extended)
      self.response = Iciba::Tools.parse(Iciba::Tools.post('http://fy.iciba.com/api.php', {:q => words, :type => dir}).body_str)
      self.html = self.response.ret
      self.result = (Iciba::Tools.doc(self.html)/'span.dd').text.strip
      self.result = self.html if self.result == ""
      self.result = self.result.split('，')[0] if self.result.include?('，') unless extended
      self.result = self.result.split('；')[0] if self.result.include?('；') unless extended
    end
  end
end