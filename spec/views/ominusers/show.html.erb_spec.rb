require 'spec_helper'

describe "ominusers/show" do
  before(:each) do
    @ominuser = assign(:ominuser, stub_model(Ominuser,
      :provider => "Provider",
      :uid => "Uid",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Provider/)
    rendered.should match(/Uid/)
    rendered.should match(/Name/)
  end
end
