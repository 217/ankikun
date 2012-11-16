require 'spec_helper'

describe "ominusers/index" do
  before(:each) do
    assign(:ominusers, [
      stub_model(Ominuser,
        :provider => "Provider",
        :uid => "Uid",
        :name => "Name"
      ),
      stub_model(Ominuser,
        :provider => "Provider",
        :uid => "Uid",
        :name => "Name"
      )
    ])
  end

  it "renders a list of ominusers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
