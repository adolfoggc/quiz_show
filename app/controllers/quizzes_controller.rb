class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
    @questions
    @count
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @questions = get_questions
    @answers
    @count = -1
    @total_questions
    @new_quiz = Quiz.new
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    if params[:commit] == 'Avançar'
      @quiz = Quiz.find(params[:quiz_id])
      answer = params[:user_answ]

      answer = compare_answers @quiz, answer
      


      respond_to do |format|
        if answer >= 0.7
          format.html { redirect_to root_path, notice: "Muito bem!" }
        else
          format.html { redirect_to root_path, notice: "Você é muito feio!" }
        end
      end
    else 
      @quiz = Quiz.new(quiz_params)
      respond_to do |format|
        if @quiz.save
          format.html { redirect_to quizzes_path, notice: 'Quiz was successfully created.' }
          format.json { render :show, status: :created, location: @quiz }
        else
          format.html { render :new }
          format.json { render json: @quiz.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quizzes_path, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_questions_from quiz
    @qq = QuizQuestion.where(quiz: quiz)
    @questions = Array.new
    @qq.each do |q|
      @questions<<Question.find(q.question_id)
    end
    return @questions
  end
  helper_method :get_questions_from

  def count_answers question 
    return 2 +  FakeAnswer.where(question_id: question).count
  end
  helper_method :count_answers

  def get_answers question
    @answers = Array.new
    @answers << question.real_answer
    @answers << question.fake_answer
    another_fake_ones = FakeAnswer.where(question: question)
    another_fake_ones.each do |afo|
      @answers << afo.answer
    end
    return @answers
  end
  helper_method :get_answers

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      if params[:commit] != 'Avançar'  
        params.require(:quiz).permit(:name)
      else
        params.permit(:quiz_id, :user_answ)
      end
    end

    def get_questions
      qq = QuizQuestion.where(quiz_id: params[:id])
      @questions = Array.new
      qq.each do |q|
        @questions<<Question.find(q.question_id)
      end
      return @questions 
    end

    def coo
      return 1
    end

    def compare_answers quiz, answers
      questions = QuizQuestion.where(quiz: quiz)
      user_answers = Array.new
      percentage = 0
      #i = 1
      questions.each do |q|
        #if questions.count > 1 && i < questions.count
        if answers.include?("&<==>&")
          position = answers.index("&<==>&")
          question_answer = answers[0, position]
          answers = answers[position+6, answers.size-position-6] 
        else
          question_answer = answers
        end
        if Question.find(q.question_id).real_answer.eql? question_answer
          percentage +=1
        end
      end
      #percentage = percentage/questions.count
      

      return percentage.to_f/questions.count.to_f
    end

    
end
