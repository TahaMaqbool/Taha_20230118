class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :thumbnail
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
