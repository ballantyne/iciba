# coding: utf-8
require 'yajl'
require 'hashie'
require 'curb'
require 'nokogiri'
require 'hpricot'
module Iciba
  module Tools

    def self.download(url)
      c = self.curb(url)
      c.body_str
    end

    def self.post(url, options)
      Curl.post(url, options)
    end

    def self.last_effective_url(url)
      c = self.curb(url)
      c.last_effective_url
    end

    def self.curb(url)
      c = Curl::Easy.new(url) do |curl| 
        curl.headers["User-Agent"] = user_agent
        # curl.verbose = true
        curl.timeout = 120
        curl.follow_location = true
        curl.max_redirects = 20
      end
      c.perform
      c
    end

    def self.parse(data)
      Hashie::Mash.new Yajl::Parser.new.parse(data)
    end

    def self.encode(data)
      Yajl::Encoder.encode(data)
    end


    def self.sleep_time
      array_of_numbers = [1.2, 2.35, 2.45, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.1, 1.4]
      random_number = array_of_numbers[rand(array_of_numbers.size)]
      random_number
    end

    def self.hashify(source)
      Digest::SHA1.hexdigest(source)
    end

    def self.user_agent
      array_of_agents = ["Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)",
                        "Mozilla/5.0 (Windows; U; Windows NT 6.1; ja; rv:1.9.2a1pre) Gecko/20090403 Firefox/3.6a1pre",
                        "Opera/9.80 (Windows NT 6.0; U; fi) Presto/2.2.0 Version/10.00",
                        "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; zh-CN) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19",
                        "ia_archiver (+http://www.alexa.com/site/help/webmasters; crawler@alexa.com)",
                        "Baiduspider+(+http://www.baidu.com/search/spider.htm)",
                        'msnbot-webmaster/1.0 (+http://search.msn.com/msnbot.htm)',
                        'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; ar) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18',
                        'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; Tablet PC 2.0; OfficeLiveConnector.1.3; OfficeLivePatch.1.3; MS-RTC LM 8; InfoPath.3)',
                        'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)',
                        'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022)']
      random_number = array_of_agents[rand(array_of_agents.size)]
      random_number
    end

    def self.doc(html)
      Hpricot(html)
    end
  end
end