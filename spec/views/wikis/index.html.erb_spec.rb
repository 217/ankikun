require 'spec_helper'

describe "wikis/index" do
  before(:each) do
    assign(:wikis, [
      stub_model(Wiki,
        :user => 1,
        :title => "Title",
        :close => false
      ),
      stub_model(Wiki,
        :user => 1,
        :title => "Title",
        :close => false
      )
    ])
  end

  it "renders a list of wikis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
