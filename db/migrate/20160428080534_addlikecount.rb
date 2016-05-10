class Addlikecount < ActiveRecord::Migration
  def change
    add_column :tweets, :likes_count, :integer
  end
end
