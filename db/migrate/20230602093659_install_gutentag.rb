class InstallGutentag < ActiveRecord::Migration[7.0]
  def change
    create_table :gutentag_taggings do |t|
      t.integer :tag_id, null: false
      t.integer :taggable_id, null: false
      t.string :taggable_type, null: false
      t.timestamps
    end

    add_index :gutentag_taggings, :tag_id
    add_index :gutentag_taggings, [:taggable_type, :taggable_id]
    add_index :gutentag_taggings, [:taggable_type, :taggable_id, :tag_id],
      :unique => true, :name => 'unique_taggings'

    create_table :gutentag_tags do |t|
      t.string :name, null: false
      t.integer :taggings_count, default: 0, null: false
      t.timestamps
    end

    add_index :gutentag_tags, :name, :unique => true
    add_index :gutentag_tags, :taggings_count
  end
end
