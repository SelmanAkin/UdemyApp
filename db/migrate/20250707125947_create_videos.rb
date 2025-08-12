class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.references :course, null: false, foreign_key: true
      t.string :video_url

      t.timestamps
    end
  end
end
