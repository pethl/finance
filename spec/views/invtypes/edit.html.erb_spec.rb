require 'spec_helper'

describe "invtypes/edit" do
  before(:each) do
    @invtype = assign(:invtype, stub_model(Invtype,
      :name => "MyString"
    ))
  end

  it "renders the edit invtype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invtype_path(@invtype), "post" do
      assert_select "input#invtype_name[name=?]", "invtype[name]"
    end
  end
end
