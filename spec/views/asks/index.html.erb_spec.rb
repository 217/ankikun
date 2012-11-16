require 'spec_helper'

describe "asks/index" do
  before(:each) do
    assign(:asks, [
      stub_model(Ask,
        :title => "Title",
        :solution => false
      ),
      stub_model(Ask,
        :title => "Title",
        :solution => false
      )
    ])
  end

  it "renders a list of asks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
