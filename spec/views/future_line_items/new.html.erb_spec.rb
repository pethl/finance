require 'spec_helper'

describe "future_line_items/new" do
  before(:each) do
    assign(:future_line_item, stub_model(FutureLineItem,
      :future_id => 1,
      :year => 1,
      :ammount => "9.99"
    ).as_new_record)
  end

  it "renders new future_line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", future_line_items_path, "post" do
      assert_select "input#future_line_item_future_id[name=?]", "future_line_item[future_id]"
      assert_select "input#future_line_item_year[name=?]", "future_line_item[year]"
      assert_select "input#future_line_item_ammount[name=?]", "future_line_item[ammount]"
    end
  end
end
