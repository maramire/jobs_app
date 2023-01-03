class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.references :applicant, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.datetime :application_date

      t.timestamps
    end
  end
end
