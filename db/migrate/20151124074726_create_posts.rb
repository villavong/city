class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :students
  end
end
