class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text        :text
      t.references  :user,  null: false, foreign_key: false
      t.references  :tweet, null: false, foreign_key: false
      t.references  :topic, null: false, foreign_key: false
      t.timestamps
    end
  end
end
