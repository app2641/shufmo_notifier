require 'spec_helper'

RSpec.describe ShufmoNotifier::Slack do
  describe '.post' do
    let(:url) { 'https://hooks.slack.com/services/xxx' }

    it 'when post to slack successful' do
      stub = stub_request(:post, url).with(body: { payload: '{"text":"hello"}' })
      ShufmoNotifier::Slack.post(url, text: 'hello')

      expect(stub).to have_been_requested
    end

    it 'when can not post to slack' do
      stub_request(:post, url).with(body: { payload: '{"text":"hello"}' }).to_raise(SocketError)
      expect { ShufmoNotifier::Slack.post(url, text: 'hello') }.to raise_error ShufmoNotifier::Exception::SlackNotifyError
    end
  end
end
