class QuizTimesController < ApplicationController
  before_action :set_quiz_time, only: [:show, :edit, :update, :destroy]

  # GET /quiz_times
  # GET /quiz_times.json
  def index
    @quiz_times = QuizTime.all
  end

  # GET /quiz_times/1
  # GET /quiz_times/1.json
  def show
  end

  # GET /quiz_times/new
  def new
    @quiz_time = QuizTime.new
  end

  # GET /quiz_times/1/edit
  def edit
  end

  # POST /quiz_times
  # POST /quiz_times.json
  def create
    @quiz_time = QuizTime.new(quiz_time_params)

    respond_to do |format|
      if @quiz_time.save
        format.html { redirect_to @quiz_time, notice: 'Quiz time was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_time }
      else
        format.html { render :new }
        format.json { render json: @quiz_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_times/1
  # PATCH/PUT /quiz_times/1.json
  def update
    respond_to do |format|
      if @quiz_time.update(quiz_time_params)
        format.html { redirect_to @quiz_time, notice: 'Quiz time was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_time }
      else
        format.html { render :edit }
        format.json { render json: @quiz_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_times/1
  # DELETE /quiz_times/1.json
  def destroy
    @quiz_time.destroy
    respond_to do |format|
      format.html { redirect_to quiz_times_url, notice: 'Quiz time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_time
      @quiz_time = QuizTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_time_params
      params.require(:quiz_time).permit(:questions, :correct_answers)
    end
end
