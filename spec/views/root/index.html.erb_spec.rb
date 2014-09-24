require 'spec_helper'

describe 'root/index.html.erb' do
  it 'displays correctly' do
    render
    expect(rendered).to include('Start new game')
  end
end