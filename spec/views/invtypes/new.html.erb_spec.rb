require 'spec_helper'

describe "invtypes/new" do
  before(:each) do
    assign(:invtype, stub_model(Invtype,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new invtype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invtypes_path, "post" do
      assert_select "input#invtype_name[name=?]", "invtype[name]"
    end
  end
end
