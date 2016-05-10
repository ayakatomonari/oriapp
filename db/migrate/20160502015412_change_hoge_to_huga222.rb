class ChangeHogeToHuga222 < ActiveRecord::Migration
  def change
         add_column :tweets, :image, :string
  end
end
