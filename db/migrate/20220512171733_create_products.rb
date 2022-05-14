class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :localisation, null: false
      t.integer :availability, null: false
      t.text :remarks
      t.float :cost
      t.text :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
