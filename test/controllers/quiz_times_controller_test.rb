require 'test_helper'

class QuizTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_time = quiz_times(:one)
  end

  test "should get index" do
    get quiz_times_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_time_url
    assert_response :success
  end

  test "should create quiz_time" do
    assert_difference('QuizTime.count') do
      post quiz_times_url, params: { quiz_time: { correct_answers: @quiz_time.correct_answers, questions: @quiz_time.questions } }
    end

    assert_redirected_to quiz_time_url(QuizTime.last)
  end

  test "should show quiz_time" do
    get quiz_time_url(@quiz_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_time_url(@quiz_time)
    assert_response :success
  end

  test "should update quiz_time" do
    patch quiz_time_url(@quiz_time), params: { quiz_time: { correct_answers: @quiz_time.correct_answers, questions: @quiz_time.questions } }
    assert_redirected_to quiz_time_url(@quiz_time)
  end

  test "should destroy quiz_time" do
    assert_difference('QuizTime.count', -1) do
      delete quiz_time_url(@quiz_time)
    end

    assert_redirected_to quiz_times_url
  end
end
