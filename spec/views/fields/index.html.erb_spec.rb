require 'rails_helper'

RSpec.describe "fields/index", type: :view do
  before(:each) do
    assign(:fields, [
      Field.create!(
        :name => "Name",
        :data_type => "Data Type",
        :default_value => "Default Value",
        :auto_increment => false,
        :allow_null => false
      ),
      Field.create!(
        :name => "Name",
        :data_type => "Data Type",
        :default_value => "Default Value",
        :auto_increment => false,
        :allow_null => false
      )
    ])
  end

  it "renders a list of fields" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Data Type".to_s, :count => 2
    assert_select "tr>td", :text => "Default Value".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
