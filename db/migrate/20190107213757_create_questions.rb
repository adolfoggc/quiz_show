class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :statement
      t.string :real_answer
      t.string :fake_answer

      t.timestamps
    end
  end
end
