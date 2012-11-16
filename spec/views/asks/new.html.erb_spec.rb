require 'spec_helper'

describe "asks/new" do
  before(:each) do
    assign(:ask, stub_model(Ask,
      :title => "MyString",
      :solution => false
    ).as_new_record)
  end

  it "renders new ask form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asks_path, :method => "post" do
      assert_select "input#ask_title", :name => "ask[title]"
      assert_select "input#ask_solution", :name => "ask[solution]"
    end
  end
end
