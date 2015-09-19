require 'rails_helper'

RSpec.describe "fields/show", type: :view do
  before(:each) do
    @field = assign(:field, Field.create!(
      :name => "Name",
      :data_type => "Data Type",
      :default_value => "Default Value",
      :auto_increment => false,
      :allow_null => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Data Type/)
    expect(rendered).to match(/Default Value/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
