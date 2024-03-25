require "application_system_test_case"

class AttachesTest < ApplicationSystemTestCase
  setup do
    @attach = attaches(:one)
  end

  test "visiting the index" do
    visit attaches_url
    assert_selector "h1", text: "Attaches"
  end

  test "should create attach" do
    visit attaches_url
    click_on "New attach"

    fill_in "File", with: @attach.file
    fill_in "Project", with: @attach.project_id
    click_on "Create Attach"

    assert_text "Attach was successfully created"
    click_on "Back"
  end

  test "should update Attach" do
    visit attach_url(@attach)
    click_on "Edit this attach", match: :first

    fill_in "File", with: @attach.file
    fill_in "Project", with: @attach.project_id
    click_on "Update Attach"

    assert_text "Attach was successfully updated"
    click_on "Back"
  end

  test "should destroy Attach" do
    visit attach_url(@attach)
    click_on "Destroy this attach", match: :first

    assert_text "Attach was successfully destroyed"
  end
end
