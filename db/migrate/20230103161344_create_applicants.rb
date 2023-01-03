class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :email
      t.string :job_title
      t.string :string
      t.text :description
      t.boolean :is_working
      t.string :country
      t.string :address
      t.string :genre
      t.text :logo
      t.string :is_disabled_person
      t.integer :expected_salary
      t.string :currency

      t.timestamps
    end
  end
end
