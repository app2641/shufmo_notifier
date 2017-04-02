require 'net/http'
require 'uri'

module ShufmoNotifier
  class Slack
    def self.post(url, options = {})
      uri = URI.parse(url)
      payload = {
        username: options[:username],
        text: options[:text],
        attachments: options[:attachments]
      }

      Net::HTTP.post_form(uri, payload: payload.to_json)
    rescue
      raise SlackNotifyError
    end
  end
end
