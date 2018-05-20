require 'rails_helper'

RSpec.shared_examples 'GET Links V1' do |url|
  include ApiHelper

  describe 'GET /:short_url' do
    context 'when short url does not exist' do
      it "returns not found" do
        get "#{url}1234"
        expect(last_response.status).to eq(404)
      end
    end

    context 'when short url exist' do
      let(:link) { create(:link) }
      before do
        allow(Link).to receive(:find).and_return(link)
      end

      it "redirect to long url" do
        get "#{url}1"
        expect(last_response.status).to eq(301)
      end

      it 'increments clicks number' do
        get "#{url}1"
        expect(link.clicks).to eq(51)
      end
    end
  end
end

RSpec.shared_examples 'POST Links V1' do |url|
  include ApiHelper

  describe 'POST /shorten' do
    let(:params) { { long_url: 'wwww.google.com' } }

    before do
      allow(Link).to receive(:new).and_return(create(:link))
    end

    it "creates a new link" do
      post url, link: params 
      expect(last_response.status).to eq(201)
    end

    it 'returns new link' do
      post url, link: params 

      body = JSON.parse(last_response.body)
      expect(body['long_url']).to eq('http://wwww.google.com')
      expect(body['short_url']).to eq('http://url_shortener.herokuapp.com/7clzi')
    end

    context 'when can\'t create a new link' do
      before do
        allow_any_instance_of(Link).to receive(:save).and_return(false)
      end

      it 'returns unprocessable entity' do
        post url, link: params 
        expect(last_response.status).to eq(422)
      end
    end
  end
end

RSpec.describe Api::V1::LinksController, type: :controller do
  include_examples 'GET Links V1', '/'
  include_examples 'GET Links V1', '/api/v1/'

  include_examples 'POST Links V1', '/shorten'
  include_examples 'POST Links V1', '/api/v1/shorten'
end
