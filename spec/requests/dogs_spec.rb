require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it "gets a list of dogs" do
      Dog.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://unsplash.com/photos/black-and-white-short-coated-dog-N04FIfHhv_k'
      )

      # Make a request
      get '/dogs'

      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(dog.length).to eq 1
    end
  end
end
