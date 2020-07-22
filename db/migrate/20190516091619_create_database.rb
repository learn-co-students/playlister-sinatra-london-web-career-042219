class CreateDatabase < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
    end
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end
    create_table :song_genres do |t|
      t.integer :song_id, :genre_id
    end
    create_table :genres do |t|
      t.string :name
    end
  end
end
