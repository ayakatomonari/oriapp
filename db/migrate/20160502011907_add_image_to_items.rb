class AddImageToItems < ActiveRecord::Migration
  def change
     add_column :tweets, :image_2, :string
  end
end
