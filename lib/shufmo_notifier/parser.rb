require 'nokogiri'
require 'open-uri'

module ShufmoNotifier
  class Parser
    def initialize(url)
      @url = url
    end

    def parse
      @doc ||= Nokogiri::HTML open(@url)
    rescue
      raise Exception::ParseError, 'HTMLを取得出来ませんでした'
    end
  end
end
