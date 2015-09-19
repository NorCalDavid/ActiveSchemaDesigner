require 'rails_helper'

RSpec.describe "tables/index", type: :view do
  before(:each) do
    assign(:tables, [
      Table.create!(
        :name => "Name",
        :comments => "MyText"
      ),
      Table.create!(
        :name => "Name",
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of tables" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
