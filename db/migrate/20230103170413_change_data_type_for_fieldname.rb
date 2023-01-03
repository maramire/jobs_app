class ChangeDataTypeForFieldname < ActiveRecord::Migration[7.0]
  def self.up
    change_table :applicants do |t|
      t.change :is_disabled_person, :boolean, using: "(CAST('F' as BOOLEAN))"
    end
  end
  def self.down
    change_table :applicants do |t|
      t.change :is_disabled_person, :string
    end
  end
end
