require 'spec_helper'

describe "future_line_items/index" do
  before(:each) do
    assign(:future_line_items, [
      stub_model(FutureLineItem,
        :future_id => 1,
        :year => 2,
        :ammount => "9.99"
      ),
      stub_model(FutureLineItem,
        :future_id => 1,
        :year => 2,
        :ammount => "9.99"
      )
    ])
  end

  it "renders a list of future_line_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
