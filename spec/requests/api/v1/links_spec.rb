require 'rails_helper'

RSpec.describe "Api::V1::Links", type: :request do
  describe "POST /create" do
    it "creates and redirects" do
      post "/api/v1/links", params: { link: { original_url: "https://rubyonrails.org" } }
      expect(response).to have_http_status(:created)
      slug = JSON.parse(response.body)["slug"]
      get "/#{slug}"
      expect(response).to redirect_to("https://rubyonrails.org")
    end
  end
end
