require 'rails_helper'

RSpec.describe "tables/new", type: :view do
  before(:each) do
    assign(:table, Table.new(
      :name => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders new table form" do
    render

    assert_select "form[action=?][method=?]", tables_path, "post" do

      assert_select "input#table_name[name=?]", "table[name]"

      assert_select "textarea#table_comments[name=?]", "table[comments]"
    end
  end
end
