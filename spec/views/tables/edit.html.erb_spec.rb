require 'rails_helper'

RSpec.describe "tables/edit", type: :view do
  before(:each) do
    @table = assign(:table, Table.create!(
      :name => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders the edit table form" do
    render

    assert_select "form[action=?][method=?]", table_path(@table), "post" do

      assert_select "input#table_name[name=?]", "table[name]"

      assert_select "textarea#table_comments[name=?]", "table[comments]"
    end
  end
end
