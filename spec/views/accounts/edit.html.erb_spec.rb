require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :name => "MyString",
      :ticker => "MyString",
      :vat => false,
      :invtype_id => 1,
      :ammount_id => 1
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_ticker[name=?]", "account[ticker]"
      assert_select "input#account_vat[name=?]", "account[vat]"
      assert_select "input#account_invtype_id[name=?]", "account[invtype_id]"
      assert_select "input#account_ammount_id[name=?]", "account[ammount_id]"
    end
  end
end
