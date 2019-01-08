class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @quiz = params[:quiz_id]
    @fake_answers = FakeAnswer.where(question_id: params[:id])
  end

  # GET /questions/new
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @quiz = Quiz.find(params[:quiz_id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new(question_params) 
    #respond_to do |format|
      if @question.save
        link_quiz_question(@quiz, @question)
        #format.json { render :show, status: :created, location: @question }
      else
        redirect_to quizzes_path
        flash[:notice] = 'Falha em criar pergunta'
        #format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    #na real, cada question pertence a um quiz, basta achar a question de mesma id
    @qq = QuizQuestion.where(question: @question)
    @qq.destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:statement, :real_answer, :fake_answer, :quiz_id)
    end

    def link_quiz_question quiz, question
      @qq = QuizQuestion.new
      @qq.quiz = quiz
      @qq.question = question
      respond_to do |format|
        if @qq.save
          format.html{ redirect_to quizzes_path, notice: 'Pergunta associada ao questionário com sucesso'}
        else
          format.html{ redirect_to quizzes_path, notice: 'Falha ao associar pergunta ao questionário'}
        end
      end
    end
end
