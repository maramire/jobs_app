class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :job_application
end
