class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color
      t.string :user_id
      t.string :bookmark_id

      t.timestamps
    end
  end
end
