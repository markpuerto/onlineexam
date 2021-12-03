class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.boolean :is_public, default: true
      t.timestamps
    end
  end
end
