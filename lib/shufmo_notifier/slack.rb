require 'json'
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
      payload = payload.delete_if { |k, v| v.nil? }

      Net::HTTP.post_form(uri, payload: payload.to_json)
    rescue => e
      raise Exception::SlackNotifyError
    end
  end
end
