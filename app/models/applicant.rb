class Applicant < ApplicationRecord
  belongs_to :user
  has_many :job_applications

  def fullname
    "#{first_name} #{last_name}"
  end
end
