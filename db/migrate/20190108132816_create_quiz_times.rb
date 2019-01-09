class CreateQuizTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_times do |t|
      t.decimal :questions
      t.decimal :correct_answers

      t.timestamps
    end
  end
end
