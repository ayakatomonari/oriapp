class ChangeHogeToHuga2 < ActiveRecord::Migration
  def change
          #変更後の型
  def up
    change_column :tweets, :image, :string
  end

  #変更前の型
  def down
    change_column :tweets, :image, :text
  end
  end
end
