module ShufmoNotifier
  class Formatter
    def self.format(items)
      msg = "今日のチラシ特売情報\n"
      msg += items.map { |item| "- #{item.description}" }.join("\n")
      msg += "\n\nref. #{ENV['SHUFMO_URL']}"
    end
  end
end
