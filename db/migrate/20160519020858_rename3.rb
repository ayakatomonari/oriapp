class Rename3 < ActiveRecord::Migration
  def up
    rename_column :users, :showname, :backimage
    #   呪文     :テーブル名, :旧カラム名, :新カラム名
  end

  def down
    rename_column :users, :backimage, :showname
    #   呪文     :テーブル名, :新カラム名, :旧カラム名
  end
end
