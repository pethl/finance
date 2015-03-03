require 'spec_helper'

describe "invtypes/index" do
  before(:each) do
    assign(:invtypes, [
      stub_model(Invtype,
        :name => "Name"
      ),
      stub_model(Invtype,
        :name => "Name"
      )
    ])
  end

  it "renders a list of invtypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
