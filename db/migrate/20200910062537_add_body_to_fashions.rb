class AddBodyToFashions < ActiveRecord::Migration[6.0]
  def change
    add_column :fashions, :body, :text
  end
end
