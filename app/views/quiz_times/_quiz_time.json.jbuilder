json.extract! quiz_time, :id, :questions, :correct_answers, :created_at, :updated_at
json.url quiz_time_url(quiz_time, format: :json)
