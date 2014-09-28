require 'spec_helper'

describe FlashHelper do
	it 'should return messages' do
		flash[:success] = 'hello'
		@result = moj_flash
		expect(@result).to include('alert-success')
		expect(@result).to include('hello')
	end
end