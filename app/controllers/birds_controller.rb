class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  #update

  def update
     new_bird=Bird.find_by(id: params[:id])
     new_bird.update(bird_params)
     render json: new_bird
  end
#custom route

   def increment_likes
    new_bird=Bird.find_by(id: params[:id])
    new_bird.update(likes: new_bird.likes + 1)
    render json: new_bird
   end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end
