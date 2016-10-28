require 'test_helper'

class GuestQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest_queue = guest_queues(:one)
  end

  test "should get index" do
    get guest_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_guest_queue_url
    assert_response :success
  end

  test "should create guest_queue" do
    assert_difference('GuestQueue.count') do
      post guest_queues_url, params: { guest_queue: { name: @guest_queue.name, no: @guest_queue.no, ticket_type: @guest_queue.ticket_type } }
    end

    assert_redirected_to guest_queue_url(GuestQueue.last)
  end

  test "should show guest_queue" do
    get guest_queue_url(@guest_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_guest_queue_url(@guest_queue)
    assert_response :success
  end

  test "should update guest_queue" do
    patch guest_queue_url(@guest_queue), params: { guest_queue: { name: @guest_queue.name, no: @guest_queue.no, ticket_type: @guest_queue.ticket_type } }
    assert_redirected_to guest_queue_url(@guest_queue)
  end

  test "should destroy guest_queue" do
    assert_difference('GuestQueue.count', -1) do
      delete guest_queue_url(@guest_queue)
    end

    assert_redirected_to guest_queues_url
  end
end
