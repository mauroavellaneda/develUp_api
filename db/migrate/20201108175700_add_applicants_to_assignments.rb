class AddApplicantsToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :applicants, :integer, array: true, default: []
  end
end

