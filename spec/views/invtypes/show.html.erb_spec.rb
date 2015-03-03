require 'spec_helper'

describe "invtypes/show" do
  before(:each) do
    @invtype = assign(:invtype, stub_model(Invtype,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
