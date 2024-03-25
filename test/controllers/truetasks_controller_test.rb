require "test_helper"

class TruetasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @truetask = truetasks(:one)
  end

  test "should get index" do
    get truetasks_url
    assert_response :success
  end

  test "should get new" do
    get new_truetask_url
    assert_response :success
  end

  test "should create truetask" do
    assert_difference("Truetask.count") do
      post truetasks_url, params: { truetask: { description: @truetask.description, name: @truetask.name } }
    end

    assert_redirected_to truetask_url(Truetask.last)
  end

  test "should show truetask" do
    get truetask_url(@truetask)
    assert_response :success
  end

  test "should get edit" do
    get edit_truetask_url(@truetask)
    assert_response :success
  end

  test "should update truetask" do
    patch truetask_url(@truetask), params: { truetask: { description: @truetask.description, name: @truetask.name } }
    assert_redirected_to truetask_url(@truetask)
  end

  test "should destroy truetask" do
    assert_difference("Truetask.count", -1) do
      delete truetask_url(@truetask)
    end

    assert_redirected_to truetasks_url
  end
end
