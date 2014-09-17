require 'spec_helper'

describe Status do
	let(:status) {build(:status)}
	values_seed

	it 'should pass factory build' do
		expect(status).to be_valid
	end

	describe 'validations' do
		it 'should fail with no name' do
			status.name=nil
			expect(status).to be_invalid
		end
	end
end