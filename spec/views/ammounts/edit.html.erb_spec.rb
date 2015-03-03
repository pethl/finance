require 'spec_helper'

describe "ammounts/edit" do
  before(:each) do
    @ammount = assign(:ammount, stub_model(Ammount,
      :ammount => "9.99",
      :estimated => false
    ))
  end

  it "renders the edit ammount form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ammount_path(@ammount), "post" do
      assert_select "input#ammount_ammount[name=?]", "ammount[ammount]"
      assert_select "input#ammount_estimated[name=?]", "ammount[estimated]"
    end
  end
end
