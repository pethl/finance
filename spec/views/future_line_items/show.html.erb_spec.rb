require 'spec_helper'

describe "future_line_items/show" do
  before(:each) do
    @future_line_item = assign(:future_line_item, stub_model(FutureLineItem,
      :future_id => 1,
      :year => 2,
      :ammount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
  end
end
