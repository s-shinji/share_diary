class CreateUserTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :user_topics do |t|
      t.references  :topic, null: false, foreign_key: true
      t.references  :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
