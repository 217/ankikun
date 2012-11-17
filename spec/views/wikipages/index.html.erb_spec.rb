require 'spec_helper'

describe "wikipages/index" do
  before(:each) do
    assign(:wikipages, [
      stub_model(Wikipage,
        :wiki_id => 1,
        :wikipage_id => 2,
        :owner_id => 3,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(Wikipage,
        :wiki_id => 1,
        :wikipage_id => 2,
        :owner_id => 3,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of wikipages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
