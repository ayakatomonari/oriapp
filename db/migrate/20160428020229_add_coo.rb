class AddCoo < ActiveRecord::Migration
  def change

    add_column :tweets, :title, :string
    add_column :tweets, :comic_number, :integer
    add_column :tweets, :get_comment, :text #コメント配列  serialize
    add_column :tweets, :get_like, :text #コメント配列  serialize


    add_column :users, :birthday, :integer
    add_column :users, :sex, :string
    add_column :users, :image, :text
    add_column :users, :give_comment, :text #コメント配列  serialize
    add_column :users, :give_like, :text #コメント配列  serialize

  end
end
