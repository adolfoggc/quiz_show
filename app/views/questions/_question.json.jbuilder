json.extract! question, :id, :statement, :real_answer, :fake_answer1, :fake_answer2, :fake_answer3, :fake_answer4, :created_at, :updated_at
json.url question_url(question, format: :json)
