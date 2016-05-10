class AddImageToItemss < ActiveRecord::Migration
  def change
    remove_column :tweets, :image_2, :string
  end
end
