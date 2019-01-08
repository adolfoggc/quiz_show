Rails.application.routes.draw do
  #resources :questions
  resources :quizzes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #rotas aninhadas para perguntas

  #get '/quizzes/:quiz_id/question/new', to: 'questions#new', as: 'new_quiz_question'
  #get '/quizzes/:quiz_id/question/edit/:id', to: 'questions#edit', as: 'edit_quiz_question'  

  scope '/quizzes/:quiz_id/' do 
  	resources :questions
  end

  root "quizzes#index"

end
