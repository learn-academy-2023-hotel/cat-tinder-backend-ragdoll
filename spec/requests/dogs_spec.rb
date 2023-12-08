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

  describe "POST /create" do
    it "creates a dog" do
      # define the params going to send with request
      dog_params = {
        dog: {
          name: 'Fred',
          age: 4,
          enjoys: 'Barking and making a mess of the litterbox',
          image: 'https://unsplash.com/photos/black-and-white-short-coated-dog-N04FIfHhv_k'
        }
      }
      # send request to the server and pass aprams needed for create
      post '/dogs', params: dog_params

      # check for successful response
      expect(response).to have_http_status(200)

      dog = Dog.first
      # Assure dog has correct attributes
      expect(dog.name).to eq 'Fred'
      expect(dog.age).to eq 4
      expect(dog.enjoys).to eq 'Barking and making a mess of the litterbox'
      expect(dog.image).to eq 'https://unsplash.com/photos/black-and-white-short-coated-dog-N04FIfHhv_k'
    end
  end

  describe "PATCH /update" do 
    it "updates a dog" do
    
      # create a dog
      dog_params = {
        dog: {
          name: 'Jimmy',
          age: 4,
          enjoys: 'Barking and making a mess of the litterbox',
          image: 'https://unsplash.com/photos/black-and-white-short-coated-dog-N04FIfHhv_k'
        }
      }
    post '/dogs', params: dog_params
    dog = Dog.first

    # Update the dog
    updated_params = {
        dog: {
          name: 'Jimmy',
          age: 4,
          enjoys: 'Barking and making a mess of the litterbox',
          image: 'https://unsplash.com/photos/black-and-white-short-coated-dog-N04FIfHhv_k'
        }
      }
      
      patch "/dogs/#{dog.id}", params: updated_params 
    
      updated_dog = Dog.find(dog.id)
      expect(response).to have_http_status 200
      expect(updated_dog.name).to eq "Jimmy"
    end
  end
  
      describe "DELETE /dogs/:id" do
        it "destroys a dog" do
          # Create a dog to delete
          dog_params = {
          dog: {
            name: 'Jimmy',
            age: 4,
            enjoys: 'Barking and making a mess of the litterbox',
            image: 'https://unsplash.com/photos/black-and-white-short-coated-dog-N04FIfHhv_k'
        }
      }
    post '/dogs', params: dog_params
    dog = Dog.first

          # Send a delete request to destroy the dog
          delete "/dogs/#{dog.id}"
      
          expect(response).to have_http_status 200
          expect(Dog.find_by(id: dog.id)).to be_nil
        end
      end

      describe "cannot create a dog without valid attributes" do
        it "can't create dog without a name" do
          dog_params = {
            dog: {
              age: 2,
              enjoys: "Enjoys long walks at the beach",
              image: 'url'
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['name']).to include "can't be blank"

        end
      end

      describe "cannot create a dog without valid attributes" do
        it "can't create dog without a age" do
          dog_params = {
            dog: {
              name: 'Jimmy',
              enjoys: "Enjoys long walks at the beach",
              image: 'url'
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['age']).to include "can't be blank"

        end
      end

      describe "cannot create a dog without valid attributes" do
        it "can't create dog without an enjoys" do
          dog_params = {
            dog: {
              name: 'Jimmy',
              age: 2,
              image: 'url'
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['enjoys']).to include "can't be blank"

        end
      end

      describe "cannot create a dog without valid attributes" do
        it "can't create dog without an image" do
          dog_params = {
            dog: {
              name: 'Jimmy',
              age: 2,
              enjoys: "Enjoys long walks at the beach",
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['image']).to include "can't be blank"

        end
      end

      describe "cannot update a dog without valid attributes" do
        it "can't update dog without a name" do
          dog_params = {
            dog: {
              age: 2,
              enjoys: "Enjoys long walks at the beach",
              image: 'url'
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['name']).to include "can't be blank"

        end
      end

      describe "cannot update a dog without valid attributes" do
        it "can't update dog without a age" do
          dog_params = {
            dog: {
              name: 'Jimmy',
              enjoys: "Enjoys long walks at the beach",
              image: 'url'
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['age']).to include "can't be blank"

        end
      end

      describe "cannot update a dog without valid attributes" do
        it "can't update dog without an enjoys" do
          dog_params = {
            dog: {
              name: 'Jimmy',
              age: 2,
              image: 'url'
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['enjoys']).to include "can't be blank"

        end
      end

      describe "cannot update a dog without valid attributes" do
        it "can't update dog without an image" do
          dog_params = {
            dog: {
              name: 'Jimmy',
              age: 2,
              enjoys: "Enjoys long walks at the beach",
            }
          }

          post '/dogs', params: dog_params
          dog = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(dog['image']).to include "can't be blank"

        end
      end
end

