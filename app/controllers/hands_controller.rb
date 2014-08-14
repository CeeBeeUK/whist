class HandsController < ApplicationController
  	before_action :authenticate_user!
  	before_action :get_hand, only: [:show]

	def show
	end


	def get_hand
		@hand = Hand.find(params[:id])
	end
end
