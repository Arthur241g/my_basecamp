require "application_system_test_case"

class TruetasksTest < ApplicationSystemTestCase
  setup do
    @truetask = truetasks(:one)
  end

  test "visiting the index" do
    visit truetasks_url
    assert_selector "h1", text: "Truetasks"
  end

  test "should create truetask" do
    visit truetasks_url
    click_on "New truetask"

    fill_in "Description", with: @truetask.description
    fill_in "Name", with: @truetask.name
    click_on "Create Truetask"

    assert_text "Truetask was successfully created"
    click_on "Back"
  end

  test "should update Truetask" do
    visit truetask_url(@truetask)
    click_on "Edit this truetask", match: :first

    fill_in "Description", with: @truetask.description
    fill_in "Name", with: @truetask.name
    click_on "Update Truetask"

    assert_text "Truetask was successfully updated"
    click_on "Back"
  end

  test "should destroy Truetask" do
    visit truetask_url(@truetask)
    click_on "Destroy this truetask", match: :first

    assert_text "Truetask was successfully destroyed"
  end
end
