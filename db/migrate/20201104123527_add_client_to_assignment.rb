class AddClientToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_reference :assignments, :client, foreign_key: { to_table: :users }
  end
end
