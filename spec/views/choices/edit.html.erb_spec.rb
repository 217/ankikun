require 'spec_helper'

describe "choices/edit" do
  before(:each) do
    @choice = assign(:choice, stub_model(Choice,
      :question_id => 1,
      :choice_id => 1,
      :choice_text => "MyText",
      :right => false
    ))
  end

  it "renders the edit choice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => choices_path(@choice), :method => "post" do
      assert_select "input#choice_question_id", :name => "choice[question_id]"
      assert_select "input#choice_choice_id", :name => "choice[choice_id]"
      assert_select "textarea#choice_choice_text", :name => "choice[choice_text]"
      assert_select "input#choice_right", :name => "choice[right]"
    end
  end
end
