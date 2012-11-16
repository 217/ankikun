require 'spec_helper'

describe "asks/show" do
  before(:each) do
    @ask = assign(:ask, stub_model(Ask,
      :title => "Title",
      :solution => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/false/)
  end
end
