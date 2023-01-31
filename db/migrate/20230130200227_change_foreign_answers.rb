class ChangeForeignAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :answers, :job_applications
    add_foreign_key :answers, :job_applications, on_delete: :cascade
  end
end
