class AddSelectedToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :selected, :integer
    add_column :assignments, :status, :integer, default: 0
  end
end