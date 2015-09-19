require 'rails_helper'

RSpec.describe "Tables", type: :request do
  describe "GET /tables" do
    it "works! (now write some real specs)" do
      get tables_path
      expect(response).to have_http_status(200)
    end
  end
end
