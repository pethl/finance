require 'spec_helper'

describe "ammounts/show" do
  before(:each) do
    @ammount = assign(:ammount, stub_model(Ammount,
      :ammount => "9.99",
      :estimated => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/false/)
  end
end
