class PlayersController < ApplicationController
  before_action :authenticate_user!
  def find
    @results = Player.where("name ILIKE :search", search: "%#{params[:q]}%").select(:id, :name)
    render json: @results
  end
end