class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :correct, default: 0
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
