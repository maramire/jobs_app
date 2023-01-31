class AddIsActiveToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :is_active, :boolean, :default => true
  end
end
