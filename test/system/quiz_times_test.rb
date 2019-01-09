require "application_system_test_case"

class QuizTimesTest < ApplicationSystemTestCase
  setup do
    @quiz_time = quiz_times(:one)
  end

  test "visiting the index" do
    visit quiz_times_url
    assert_selector "h1", text: "Quiz Times"
  end

  test "creating a Quiz time" do
    visit quiz_times_url
    click_on "New Quiz Time"

    fill_in "Correct answers", with: @quiz_time.correct_answers
    fill_in "Questions", with: @quiz_time.questions
    click_on "Create Quiz time"

    assert_text "Quiz time was successfully created"
    click_on "Back"
  end

  test "updating a Quiz time" do
    visit quiz_times_url
    click_on "Edit", match: :first

    fill_in "Correct answers", with: @quiz_time.correct_answers
    fill_in "Questions", with: @quiz_time.questions
    click_on "Update Quiz time"

    assert_text "Quiz time was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz time" do
    visit quiz_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz time was successfully destroyed"
  end
end
