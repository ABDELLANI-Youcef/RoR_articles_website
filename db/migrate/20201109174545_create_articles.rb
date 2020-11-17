class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, unique: true
      t.text :text, null: false
      t.timestamps
    end
  end
end
