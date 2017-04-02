module ShufmoNotifier
  module Exception
    class ParseError < StandardError
    end

    class SearchError < StandardError
    end

    class SlackNotifyError < StandardError
    end
  end
end
