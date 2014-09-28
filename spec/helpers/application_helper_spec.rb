require 'spec_helper'

describe ApplicationHelper do 
	it 'should return flash types' do
		expect(flash_class_for(:success)).to eql('alert-success')
		expect(flash_class_for(:error)).to eql('alert-danger')
		expect(flash_class_for(:alert)).to eql('alert-info')
		expect(flash_class_for(:notice)).to eql('alert-info')
      	expect(flash_class_for('wibble')).to eql('wibble')
	end
end