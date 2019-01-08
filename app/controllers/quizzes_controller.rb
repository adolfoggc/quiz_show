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
      params.require(:quiz).permit(:name)
    end

    def get_questions
      qq = QuizQuestion.where(quiz_id: params[:id])
      @questions = Array.new
      qq.each do |q|
        @questions<<Question.find(q.question_id)
      end
      return @questions 
    end

    
end
