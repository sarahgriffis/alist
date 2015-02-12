class CreateCelebrityVotes < ActiveRecord::Migration
  def change
    create_table :celebrity_votes do |t|
      t.integer :celebrity_id
      t.integer :user_id
      t.integer :vote_value

      t.timestamps null: false
    end
  end
end
