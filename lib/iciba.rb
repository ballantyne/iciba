# coding: utf-8
require 'iciba/tools'
require 'iciba/fanyi'

class String
  def contains_cjk?
    !!(self.force_encoding("UTF-8") =~ /\p{Han}/)
  end
end