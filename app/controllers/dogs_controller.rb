class DogsController < ApplicationController
    def index
      	dogs = Dog.all
      	render json: dogs
    end

    def create
      	dog = Dog.create(dog_params)
				if dog.valid?
      		render json: dog
				else
					render json: dog.errors, status: 422
				end
    end

    def update
			dog = Dog.create(dog_params)
			if dog.valid?
				render json: dog
			else
				render json: dog.errors, status: 422
			end
    end

    def destroy
        dog = Dog.find(params[:id])
        dog.destroy
        render json: dog
    end

    private
    # strong params
    def dog_params
        params.require(:dog).permit(:name, :age, :enjoys, :image)
    end
end
