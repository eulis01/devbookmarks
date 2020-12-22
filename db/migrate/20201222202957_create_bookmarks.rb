class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :url
      t.string :tag_id

      t.timestamps
    end
  end
end
