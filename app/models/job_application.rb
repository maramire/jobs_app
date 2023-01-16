class JobApplication < ApplicationRecord
  belongs_to :applicant
  belongs_to :job
  has_many :answers

  accepts_nested_attributes_for :answers, :allow_destroy => true, reject_if: :reject_answers

  def reject_answers(attributes)
    attributes['answer_text'].blank?
  end
end
