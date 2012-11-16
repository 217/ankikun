require 'spec_helper'

describe "wikis/show" do
  before(:each) do
    @wiki = assign(:wiki, stub_model(Wiki,
      :user => 1,
      :title => "Title",
      :close => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/false/)
  end
end
