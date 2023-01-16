class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications
  has_many :questions

  accepts_nested_attributes_for :questions, :allow_destroy => true, reject_if: :reject_questions

  def reject_questions(attributes)
    attributes['title'].blank?
  end
end
