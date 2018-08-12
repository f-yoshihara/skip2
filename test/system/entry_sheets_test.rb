require "application_system_test_case"

class EntrySheetsTest < ApplicationSystemTestCase
  setup do
    @entry_sheet = entry_sheets(:one)
  end

  test "visiting the index" do
    visit entry_sheets_url
    assert_selector "h1", text: "Entry Sheets"
  end

  test "creating a Entry sheet" do
    visit entry_sheets_url
    click_on "New Entry Sheet"

    fill_in "How", with: @entry_sheet.how
    fill_in "Recruitment", with: @entry_sheet.recruitment_id
    fill_in "Status", with: @entry_sheet.status
    fill_in "Student", with: @entry_sheet.student_id
    fill_in "What", with: @entry_sheet.what
    fill_in "Why", with: @entry_sheet.why
    click_on "Create Entry sheet"

    assert_text "Entry sheet was successfully created"
    click_on "Back"
  end

  test "updating a Entry sheet" do
    visit entry_sheets_url
    click_on "Edit", match: :first

    fill_in "How", with: @entry_sheet.how
    fill_in "Recruitment", with: @entry_sheet.recruitment_id
    fill_in "Status", with: @entry_sheet.status
    fill_in "Student", with: @entry_sheet.student_id
    fill_in "What", with: @entry_sheet.what
    fill_in "Why", with: @entry_sheet.why
    click_on "Update Entry sheet"

    assert_text "Entry sheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Entry sheet" do
    visit entry_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entry sheet was successfully destroyed"
  end
end
