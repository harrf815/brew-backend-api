class CreateFeedBacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feed_backs do |t|
      t.string :comments
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
