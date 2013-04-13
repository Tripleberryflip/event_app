require 'test_helper'

class EventCoordinatorsControllerTest < ActionController::TestCase
  setup do
    @event_coordinator = event_coordinators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_coordinators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_coordinator" do
    assert_difference('EventCoordinator.count') do
      post :create, event_coordinator: { name: @event_coordinator.name }
    end

    assert_redirected_to event_coordinator_path(assigns(:event_coordinator))
  end

  test "should show event_coordinator" do
    get :show, id: @event_coordinator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_coordinator
    assert_response :success
  end

  test "should update event_coordinator" do
    put :update, id: @event_coordinator, event_coordinator: { name: @event_coordinator.name }
    assert_redirected_to event_coordinator_path(assigns(:event_coordinator))
  end

  test "should destroy event_coordinator" do
    assert_difference('EventCoordinator.count', -1) do
      delete :destroy, id: @event_coordinator
    end

    assert_redirected_to event_coordinators_path
  end
end
