Rails.application.routes.draw do
  

  #resources :quiz_times
  #resources :questions
  resources :quizzes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #rotas aninhadas para perguntas

  scope '/quizzes/:quiz_id/' do 
  	resources :questions
  end

  scope '/quizzes/:quiz_id/questions/:question_id/' do
    resources :fake_answers
  end

  #renomeando resource
  resources :quiz_time, controller: 'quiz_times'

  root "quizzes#index"

end
