class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.text :title
      t.text :description
      t.integer :salary
      t.string :currency
      t.datetime :publication_date
      t.datetime :expiration_date
      t.integer :minimum_experience
      t.integer :maximum_experience
      t.boolean :is_inclusive
      t.integer :vacant_number
      t.text :location
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
