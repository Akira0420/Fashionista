class AddUseIdToFashions < ActiveRecord::Migration[6.0]
  def change
    add_column :fashions, :user_id, :integer
  end
end
