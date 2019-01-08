class CreateQuizQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
