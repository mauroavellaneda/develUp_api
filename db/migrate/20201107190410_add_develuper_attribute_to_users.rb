class AddDeveluperAttributeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :skills, :text, array: true, default: []
    add_column :users, :points, :integer, default: 0
    add_column :users, :level, :integer, default: 0
    add_column :users, :completed_projects, :integer, default: 0
  end
end
