RSpec.describe ApplicationController, type: :controller do
  include ApiHelper

  describe 'GET index' do
    it "returns status ok" do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({status: 'Ok'}.to_json)
    end
  end
end
