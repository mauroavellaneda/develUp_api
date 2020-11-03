class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :skills, array: true, default: []
      t.integer :points
      t.integer :budget

      t.timestamps
    end
  end
end
