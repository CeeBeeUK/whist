class HandsController < ApplicationController
  	before_action :authenticate_user!
  	before_action :get_hand, only: [:show, :start]

	def show
	end

	def start
	end

private

	def get_hand
		@hand = Hand.where('game_id=:g_id and sequence=:seq', g_id: params[:g_id], seq: params[:seq]).first
	end
end
