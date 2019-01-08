class FakeAnswersController < ApplicationController
  before_action :set_fake_answer, only: [:show, :edit, :update, :destroy]

  # GET /fake_answers
  # GET /fake_answers.json
  def index
    @fake_answers = FakeAnswer.all
  end

  # GET /fake_answers/1
  # GET /fake_answers/1.json
  def show
  end

  # GET /fake_answers/new
  def new
    @fake_answer = FakeAnswer.new
  end

  # GET /fake_answers/1/edit
  def edit
  end

  # POST /fake_answers
  # POST /fake_answers.json
  def create
    @fake_answer = FakeAnswer.new(fake_answer_params)
    @fake_answer.question_id = params[:question_id]
    respond_to do |format|
      if @fake_answer.save
        format.html { redirect_to question_path(params[:quiz_id], params[:question_id]), notice: 'Fake answer was successfully created.' }
        format.json { render :show, status: :created, location: @fake_answer }
      else
        format.html { render :new }
        format.json { render json: @fake_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fake_answers/1
  # PATCH/PUT /fake_answers/1.json
  def update
    respond_to do |format|
      if @fake_answer.update(fake_answer_params)
        format.html { redirect_to @fake_answer, notice: 'Fake answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @fake_answer }
      else
        format.html { render :edit }
        format.json { render json: @fake_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fake_answers/1
  # DELETE /fake_answers/1.json
  def destroy
    @fake_answer.destroy
    respond_to do |format|
      format.html { redirect_to fake_answers_url, notice: 'Fake answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_answer
      @fake_answer = FakeAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fake_answer_params
      params.require(:fake_answer).permit(:answer, :question_id, :quiz_id)
    end
end
