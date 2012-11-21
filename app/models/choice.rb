class Choice < ActiveRecord::Base
	belongs_to :question

  validate :validate_choice_text_presence

	attr_accessible :choice_text, :right, :question_id, :choice_id, :exam_id
private
  def validate_choice_text_presence
    if (question.kind == 1 || question.kind == 2) && choice_text.empty?
      errors.add(:choice_text, "nothing")
    end
  end
end
