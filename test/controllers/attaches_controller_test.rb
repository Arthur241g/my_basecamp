require "test_helper"

class AttachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attach = attaches(:one)
  end

  test "should get index" do
    get attaches_url
    assert_response :success
  end

  test "should get new" do
    get new_attach_url
    assert_response :success
  end

  test "should create attach" do
    assert_difference("Attach.count") do
      post attaches_url, params: { attach: { file: @attach.file, project_id: @attach.project_id } }
    end

    assert_redirected_to attach_url(Attach.last)
  end

  test "should show attach" do
    get attach_url(@attach)
    assert_response :success
  end

  test "should get edit" do
    get edit_attach_url(@attach)
    assert_response :success
  end

  test "should update attach" do
    patch attach_url(@attach), params: { attach: { file: @attach.file, project_id: @attach.project_id } }
    assert_redirected_to attach_url(@attach)
  end

  test "should destroy attach" do
    assert_difference("Attach.count", -1) do
      delete attach_url(@attach)
    end

    assert_redirected_to attaches_url
  end
end
