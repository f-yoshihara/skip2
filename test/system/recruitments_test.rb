require "application_system_test_case"

class RecruitmentsTest < ApplicationSystemTestCase
  setup do
    @recruitment = recruitments(:one)
  end

  test "visiting the index" do
    visit recruitments_url
    assert_selector "h1", text: "Recruitments"
  end

  test "creating a Recruitment" do
    visit recruitments_url
    click_on "New Recruitment"

    fill_in "Body", with: @recruitment.body
    fill_in "Company", with: @recruitment.company_id
    fill_in "Deadline", with: @recruitment.deadline
    fill_in "Occupation", with: @recruitment.occupation_id
    fill_in "Status", with: @recruitment.status
    fill_in "Title", with: @recruitment.title
    click_on "Create Recruitment"

    assert_text "Recruitment was successfully created"
    click_on "Back"
  end

  test "updating a Recruitment" do
    visit recruitments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @recruitment.body
    fill_in "Company", with: @recruitment.company_id
    fill_in "Deadline", with: @recruitment.deadline
    fill_in "Occupation", with: @recruitment.occupation_id
    fill_in "Status", with: @recruitment.status
    fill_in "Title", with: @recruitment.title
    click_on "Update Recruitment"

    assert_text "Recruitment was successfully updated"
    click_on "Back"
  end

  test "destroying a Recruitment" do
    visit recruitments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recruitment was successfully destroyed"
  end
end
