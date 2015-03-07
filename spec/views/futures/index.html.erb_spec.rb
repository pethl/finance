require 'spec_helper'

describe "futures/index" do
  before(:each) do
    assign(:futures, [
      stub_model(Future,
        :account_id => 1,
        :years => 2,
        :rate => "9.99"
      ),
      stub_model(Future,
        :account_id => 1,
        :years => 2,
        :rate => "9.99"
      )
    ])
  end

  it "renders a list of futures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
