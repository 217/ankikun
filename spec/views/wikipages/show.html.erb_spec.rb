require 'spec_helper'

describe "wikipages/show" do
  before(:each) do
    @wikipage = assign(:wikipage, stub_model(Wikipage,
      :wiki_id => 1,
      :wikipage_id => 2,
      :owner_id => 3,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
