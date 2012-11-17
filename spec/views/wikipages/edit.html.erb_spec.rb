require 'spec_helper'

describe "wikipages/edit" do
  before(:each) do
    @wikipage = assign(:wikipage, stub_model(Wikipage,
      :wiki_id => 1,
      :wikipage_id => 1,
      :owner_id => 1,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit wikipage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wikipages_path(@wikipage), :method => "post" do
      assert_select "input#wikipage_wiki_id", :name => "wikipage[wiki_id]"
      assert_select "input#wikipage_wikipage_id", :name => "wikipage[wikipage_id]"
      assert_select "input#wikipage_owner_id", :name => "wikipage[owner_id]"
      assert_select "input#wikipage_title", :name => "wikipage[title]"
      assert_select "textarea#wikipage_body", :name => "wikipage[body]"
    end
  end
end
