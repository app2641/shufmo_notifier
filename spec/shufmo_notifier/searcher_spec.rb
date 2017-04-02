require 'spec_helper'

RSpec.describe ShufmoNotifier::Searcher do
  describe '#search' do
    let(:searcher) { ShufmoNotifier::Searcher.new(doc) }
    let(:html) { File.open(path) }
    let(:path) { File.expand_path('../../fixtures/seed.html', __FILE__) }

    context 'when argument is not Nokogiri::HTML::Document' do
      let(:doc) { nil }

      it { expect{ searcher.search }.to raise_error ShufmoNotifier::Exception::SearchError }
    end

    context 'when arugment is Nokogiri::HTML::Document' do
      let(:doc) { Nokogiri::HTML open(html) }
      let(:result) { searcher.search.first }

      it do
        expect(result.product).to eq 'レタス　（Ｌ）'
        expect(result.detail).to eq '茨城県などの国内産 1コ'
        expect(result.price).to eq '￥158(税抜き)'
        expect(result.description).to eq 'レタス（Ｌ） 茨城県などの国内産1コ ￥158(税抜き)'
      end
    end
  end
end
