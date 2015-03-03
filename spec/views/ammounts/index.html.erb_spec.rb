require 'spec_helper'

describe "ammounts/index" do
  before(:each) do
    assign(:ammounts, [
      stub_model(Ammount,
        :ammount => "9.99",
        :estimated => false
      ),
      stub_model(Ammount,
        :ammount => "9.99",
        :estimated => false
      )
    ])
  end

  it "renders a list of ammounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
