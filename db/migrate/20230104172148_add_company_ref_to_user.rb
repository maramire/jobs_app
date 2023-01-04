class AddCompanyRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :user, foreign_key: true
    add_reference :applicants, :user, foreign_key: true
  end
end
