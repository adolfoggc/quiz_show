require 'test_helper'

class FakeAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fake_answer = fake_answers(:one)
  end

  test "should get index" do
    get fake_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_fake_answer_url
    assert_response :success
  end

  test "should create fake_answer" do
    assert_difference('FakeAnswer.count') do
      post fake_answers_url, params: { fake_answer: { answer: @fake_answer.answer, question_id: @fake_answer.question_id } }
    end

    assert_redirected_to fake_answer_url(FakeAnswer.last)
  end

  test "should show fake_answer" do
    get fake_answer_url(@fake_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_fake_answer_url(@fake_answer)
    assert_response :success
  end

  test "should update fake_answer" do
    patch fake_answer_url(@fake_answer), params: { fake_answer: { answer: @fake_answer.answer, question_id: @fake_answer.question_id } }
    assert_redirected_to fake_answer_url(@fake_answer)
  end

  test "should destroy fake_answer" do
    assert_difference('FakeAnswer.count', -1) do
      delete fake_answer_url(@fake_answer)
    end

    assert_redirected_to fake_answers_url
  end
end
