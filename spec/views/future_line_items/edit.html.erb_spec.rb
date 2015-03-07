require 'spec_helper'

describe "future_line_items/edit" do
  before(:each) do
    @future_line_item = assign(:future_line_item, stub_model(FutureLineItem,
      :future_id => 1,
      :year => 1,
      :ammount => "9.99"
    ))
  end

  it "renders the edit future_line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", future_line_item_path(@future_line_item), "post" do
      assert_select "input#future_line_item_future_id[name=?]", "future_line_item[future_id]"
      assert_select "input#future_line_item_year[name=?]", "future_line_item[year]"
      assert_select "input#future_line_item_ammount[name=?]", "future_line_item[ammount]"
    end
  end
end
