require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '.find' do

    context 'when there is link with the short url' do
      let(:link) { create(:link) }
      before { link }

      it 'returns link' do
        expect(Link.find('7clzi')).to eq(link)
      end
    end

    context 'when there are no links with the short url' do
      it 'returns nil' do
        expect(Link.find('7clzi')).to eq(nil)
      end
    end
  end

  describe '.new' do
    subject { Link.new(params) }
    let(:params) { { long_url: 'google.com' } }

    it 'shortened URL' do
      subject.save
      expect(subject.short_url).to eq("http://shortenerurl-staging.com/1")
    end

    context 'when a URL has no protocol' do
      it 'appends protocol' do
        subject.save
        expect(subject.long_url).to eq('http://google.com')
      end
    end

    context 'when a URL has protocol' do
      let(:params) { { long_url: 'http://google.com' } }

      it 'uses the original url' do
        subject.save
        expect(subject.long_url).to eq(params[:long_url])
      end
    end
  end
end