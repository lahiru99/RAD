class CreateScoreTable < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :correct_answers
      t.integer :attempt
      t.timestamp :submitted_at
    end
  end
end
