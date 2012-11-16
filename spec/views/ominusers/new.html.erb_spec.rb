require 'spec_helper'

describe "ominusers/new" do
  before(:each) do
    assign(:ominuser, stub_model(Ominuser,
      :provider => "MyString",
      :uid => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new ominuser form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ominusers_path, :method => "post" do
      assert_select "input#ominuser_provider", :name => "ominuser[provider]"
      assert_select "input#ominuser_uid", :name => "ominuser[uid]"
      assert_select "input#ominuser_name", :name => "ominuser[name]"
    end
  end
end
