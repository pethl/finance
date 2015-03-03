require 'spec_helper'

describe "ammounts/new" do
  before(:each) do
    assign(:ammount, stub_model(Ammount,
      :ammount => "9.99",
      :estimated => false
    ).as_new_record)
  end

  it "renders new ammount form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ammounts_path, "post" do
      assert_select "input#ammount_ammount[name=?]", "ammount[ammount]"
      assert_select "input#ammount_estimated[name=?]", "ammount[estimated]"
    end
  end
end
