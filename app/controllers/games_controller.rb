class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(game_params)
    if @game.save
      redirect_to games_path, notice: "Game was successfully created."
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to games_path, notice: "Game was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: "Game was successfully deleted."
  end

  private

  def game_params
    params.require(:game).permit(:game_type, :winner, :runner_up, player_names: [])
  end
end
