require 'test_helper'

class EntrySheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_sheet = entry_sheets(:one)
  end

  test "should get index" do
    get entry_sheets_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_sheet_url
    assert_response :success
  end

  test "should create entry_sheet" do
    assert_difference('EntrySheet.count') do
      post entry_sheets_url, params: { entry_sheet: { how: @entry_sheet.how, recruitment_id: @entry_sheet.recruitment_id, status: @entry_sheet.status, student_id: @entry_sheet.student_id, what: @entry_sheet.what, why: @entry_sheet.why } }
    end

    assert_redirected_to entry_sheet_url(EntrySheet.last)
  end

  test "should show entry_sheet" do
    get entry_sheet_url(@entry_sheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_sheet_url(@entry_sheet)
    assert_response :success
  end

  test "should update entry_sheet" do
    patch entry_sheet_url(@entry_sheet), params: { entry_sheet: { how: @entry_sheet.how, recruitment_id: @entry_sheet.recruitment_id, status: @entry_sheet.status, student_id: @entry_sheet.student_id, what: @entry_sheet.what, why: @entry_sheet.why } }
    assert_redirected_to entry_sheet_url(@entry_sheet)
  end

  test "should destroy entry_sheet" do
    assert_difference('EntrySheet.count', -1) do
      delete entry_sheet_url(@entry_sheet)
    end

    assert_redirected_to entry_sheets_url
  end
end
