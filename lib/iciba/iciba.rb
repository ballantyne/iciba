require '/lib/iciba/tools'
module Iciba
  class Iciba
    attr_accessor :response, :html, :dir, :result

    def initialize(words, dir='auto')
      self.response = Tools.parse(Tools.post('http://fy.iciba.com/api.php', {:q => words, :type => dir}).body_str)
      self.html = self.response.ret
      self.result = (Tools.doc(self.html)/'span.dd').text.strip
      self.result = self.html if self.result == ""
      puts '-------------------------------------------------'
      puts self.result
      puts '-------------------------------------------------'
      return self.result
    end
  end
end