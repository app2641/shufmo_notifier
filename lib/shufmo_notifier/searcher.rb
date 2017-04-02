module ShufmoNotifier
  class Searcher
    Item = Struct.new(:product, :detail, :price) do
      def description
        values.map do |str|
          str.gsub(/\p{blank}/, '')
        end.join(' ')
      end
    end

    def initialize(doc)
      @doc = doc
    end

    def search
      results = @doc.css('div.tabPanel#tab01-1-1 div.col')
      results.map do |result|
        product = result.at_css('p.product span').text
        detail = result.at_css('div.detail p').text
        price = result.at_css('a figure.image figcaption.txtPrice').text

        Item.new(product, detail, price)
      end
    rescue
      raise Exception::SearchError
    end
  end
end
