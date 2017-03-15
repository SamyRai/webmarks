class InitialMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, uniqueness: true, null: false

      t.timestamps
    end

    create_table :sites do |t|
      t.string :top_url, uniqueness: true, null: false

      t.timestamps
    end

    create_table :users do |t|
      t.string :email, uniqueness: true, null: false
      t.string :password, null: false

      t.timestamps
    end

    create_table :bookmarks do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :shortening

      t.timestamps
    end

    add_reference :bookmarks, :user, foreign_key: true
    add_reference :bookmarks, :site, foreign_key: true

    create_join_table :bookmarks, :tags do |t|
      t.index [:bookmark_id, :tag_id]
    end
  end
end
