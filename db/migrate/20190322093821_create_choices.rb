class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true
      t.references :lesson, foreign_key: true
      t.references :word, foreign_key: true
      t.integer :is_correct_answer

      t.timestamps
    end
  end
end
