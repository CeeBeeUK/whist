require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do

  describe "GET 'find'" do
    it "returns http success" do
      get 'find'
      expect(response).to be_success
    end
  end

end
