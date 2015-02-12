class CreateCelebrities < ActiveRecord::Migration
  def change
    create_table :celebrities do |t|
      t.string :first_name
      t.string :last_name
      t.text :photo_url

      t.timestamps null: false
    end
  end
end
