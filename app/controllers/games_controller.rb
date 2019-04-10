class GamesController < ApplicationController
  # Add your GamesController code here
  def index
    @games = Game.all
    render json: @games
  end

  def show
    @game = Game.find(params[:id])
    render json: @game, status: 200
  end

  def create
    @game = Game.new
    @game.state = game_params["state"]
    @game.save
    redirect_to game_path(@game)
  end

  def update
    @game = Game.find(params[:id])
    @game.update(state: params["state"])
  end

  private

  def game_params
    params.permit(:state => [])
  end

end