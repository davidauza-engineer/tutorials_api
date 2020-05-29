class CreateTutorials < ActiveRecord::Migration[6.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.integer :published_status

      t.timestamps
    end
  end
end
