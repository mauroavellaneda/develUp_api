class AddCompanyNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_url, :string
    add_column :users, :role, :integer
  end
end
