class AddDescriptionToAssigments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :description, :text
    add_column :assignments, :timeframe, :integer, default: 0
  end
end
