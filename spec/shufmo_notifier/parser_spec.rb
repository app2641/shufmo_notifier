require 'spec_helper'

RSpec.describe ShufmoNotifier::Parser do
  let(:parser) { ShufmoNotifier::Parser.new(url) }

  describe '#parse' do
    context 'url is not specified' do
      let(:url) { nil }

      it { expect { parser.parse }.to raise_error ShufmoNotifier::Exception::ParseError, 'HTMLを取得出来ませんでした' }
    end

    context 'url is sepcified' do
      let(:url) { File.expand_path('../../fixtures/seed.html', __FILE__) }

      it { expect(parser.parse).to be_a Nokogiri::HTML::Document }
    end
  end
end
