class AddOngoingAssignmentToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ongoing_assignment, :integer
  end
end
