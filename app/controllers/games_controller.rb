class GamesController < ApplicationController
  before_action :authenticate_user!

  def life_simulator
  end
end
