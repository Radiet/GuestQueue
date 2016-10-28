require 'test_helper'

class GqueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gqueue = gqueues(:one)
  end

  test "should get index" do
    get gqueues_url
    assert_response :success
  end

  test "should get new" do
    get new_gqueue_url
    assert_response :success
  end

  test "should create gqueue" do
    assert_difference('Gqueue.count') do
      post gqueues_url, params: { gqueue: { locket_type: @gqueue.locket_type, name: @gqueue.name, no: @gqueue.no } }
    end

    assert_redirected_to gqueue_url(Gqueue.last)
  end

  test "should show gqueue" do
    get gqueue_url(@gqueue)
    assert_response :success
  end

  test "should get edit" do
    get edit_gqueue_url(@gqueue)
    assert_response :success
  end

  test "should update gqueue" do
    patch gqueue_url(@gqueue), params: { gqueue: { locket_type: @gqueue.locket_type, name: @gqueue.name, no: @gqueue.no } }
    assert_redirected_to gqueue_url(@gqueue)
  end

  test "should destroy gqueue" do
    assert_difference('Gqueue.count', -1) do
      delete gqueue_url(@gqueue)
    end

    assert_redirected_to gqueues_url
  end
end
