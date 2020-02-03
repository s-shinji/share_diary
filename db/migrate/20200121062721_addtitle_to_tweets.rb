class AddtitleToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :title, :string, null:false
  end
end
