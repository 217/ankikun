require 'spec_helper'

describe "responses/edit" do
  before(:each) do
    @response = assign(:response, stub_model(Response,
      :ask_id => 1,
      :response_num => 1,
      :user => 1,
      :body => "MyText"
    ))
  end

  it "renders the edit response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => responses_path(@response), :method => "post" do
      assert_select "input#response_ask_id", :name => "response[ask_id]"
      assert_select "input#response_response_num", :name => "response[response_num]"
      assert_select "input#response_user", :name => "response[user]"
      assert_select "textarea#response_body", :name => "response[body]"
    end
  end
end
