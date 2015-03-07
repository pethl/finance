require 'spec_helper'

describe "futures/new" do
  before(:each) do
    assign(:future, stub_model(Future,
      :account_id => 1,
      :years => 1,
      :rate => "9.99"
    ).as_new_record)
  end

  it "renders new future form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", futures_path, "post" do
      assert_select "input#future_account_id[name=?]", "future[account_id]"
      assert_select "input#future_years[name=?]", "future[years]"
      assert_select "input#future_rate[name=?]", "future[rate]"
    end
  end
end
