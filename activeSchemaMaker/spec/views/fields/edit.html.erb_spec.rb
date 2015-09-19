require 'rails_helper'

RSpec.describe "fields/edit", type: :view do
  before(:each) do
    @field = assign(:field, Field.create!(
      :name => "MyString",
      :data_type => "MyString",
      :default_value => "MyString",
      :auto_increment => false,
      :allow_null => false
    ))
  end

  it "renders the edit field form" do
    render

    assert_select "form[action=?][method=?]", field_path(@field), "post" do

      assert_select "input#field_name[name=?]", "field[name]"

      assert_select "input#field_data_type[name=?]", "field[data_type]"

      assert_select "input#field_default_value[name=?]", "field[default_value]"

      assert_select "input#field_auto_increment[name=?]", "field[auto_increment]"

      assert_select "input#field_allow_null[name=?]", "field[allow_null]"
    end
  end
end
