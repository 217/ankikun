require 'spec_helper'

describe "choices/index" do
  before(:each) do
    assign(:choices, [
      stub_model(Choice,
        :question_id => 1,
        :choice_id => 2,
        :choice_text => "MyText",
        :right => false
      ),
      stub_model(Choice,
        :question_id => 1,
        :choice_id => 2,
        :choice_text => "MyText",
        :right => false
      )
    ])
  end

  it "renders a list of choices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
