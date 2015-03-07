require 'spec_helper'

describe "futures/show" do
  before(:each) do
    @future = assign(:future, stub_model(Future,
      :account_id => 1,
      :years => 2,
      :rate => "9.99"
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
