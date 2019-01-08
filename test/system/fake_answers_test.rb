require "application_system_test_case"

class FakeAnswersTest < ApplicationSystemTestCase
  setup do
    @fake_answer = fake_answers(:one)
  end

  test "visiting the index" do
    visit fake_answers_url
    assert_selector "h1", text: "Fake Answers"
  end

  test "creating a Fake answer" do
    visit fake_answers_url
    click_on "New Fake Answer"

    fill_in "Answer", with: @fake_answer.answer
    fill_in "Question", with: @fake_answer.question_id
    click_on "Create Fake answer"

    assert_text "Fake answer was successfully created"
    click_on "Back"
  end

  test "updating a Fake answer" do
    visit fake_answers_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @fake_answer.answer
    fill_in "Question", with: @fake_answer.question_id
    click_on "Update Fake answer"

    assert_text "Fake answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Fake answer" do
    visit fake_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fake answer was successfully destroyed"
  end
end
