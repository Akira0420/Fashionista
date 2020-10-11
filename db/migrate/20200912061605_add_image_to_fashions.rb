class AddImageToFashions < ActiveRecord::Migration[6.0]
  def change
    add_column :fashions, :image, :string
  end
end
