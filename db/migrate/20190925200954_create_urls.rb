class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :short_url
      t.string :full_url
      t.string :page_title
      t.integer :hit_counter, default: 0

      t.timestamps
    end
  end
end
