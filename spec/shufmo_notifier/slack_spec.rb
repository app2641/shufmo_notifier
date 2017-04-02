require 'spec_helper'
require 'webmock'

RSpec.describe ShufmoNotifier::Slack do
  include WebMock::API

  describe '.post' do
    let(:url) { 'https://hooks.slack.com/services/xxx' }

    it 'should post to slack' do
      stub = stub_request(:post, url).with(body: { payload: '{ text: hello }' })
      ShufmoNotifier::Slack.post(url, text: 'hello')

      expect(stub).to have_been_requested
    end
  end
end
