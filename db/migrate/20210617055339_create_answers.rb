class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question
      t.integer :answer
      t.integer :score_id
      t.boolean :correct
    end
  end
end
