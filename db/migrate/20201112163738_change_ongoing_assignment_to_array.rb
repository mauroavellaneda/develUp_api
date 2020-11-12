class ChangeOngoingAssignmentToArray < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :ongoing_assignment, :integer, array: true, default: [], using: 'ARRAY[ongoing_assignment]::INTEGER[]'
  end
end

