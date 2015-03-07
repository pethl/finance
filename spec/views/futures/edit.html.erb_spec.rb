require 'spec_helper'

describe "futures/edit" do
  before(:each) do
    @future = assign(:future, stub_model(Future,
      :account_id => 1,
      :years => 1,
      :rate => "9.99"
    ))
  end

  it "renders the edit future form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", future_path(@future), "post" do
      assert_select "input#future_account_id[name=?]", "future[account_id]"
      assert_select "input#future_years[name=?]", "future[years]"
      assert_select "input#future_rate[name=?]", "future[rate]"
    end
  end
end
