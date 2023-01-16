class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :job_application, null: false, foreign_key: true
      t.text :answer_text

      t.timestamps
    end
  end
end
