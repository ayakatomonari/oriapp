class Rename2 < ActiveRecord::Migration
  def up
    rename_column :users, :sex, :showname
    #   呪文     :テーブル名, :旧カラム名, :新カラム名
  end

  def down
    rename_column :users, :showname, :sex
    #   呪文     :テーブル名, :新カラム名, :旧カラム名
  end
end
