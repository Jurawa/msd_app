require 'test_helper'

class ComplicationsControllerTest < ActionController::TestCase
  setup do
    @complication = complications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complication" do
    assert_difference('Complication.count') do
      post :create, complication: { anesthesia_related: @complication.anesthesia_related, death: @complication.death, death_preventable: @complication.death_preventable, description: @complication.description, error_grade: @complication.error_grade, error_type: @complication.error_type, operation_record_id: @complication.operation_record_id, preventable: @complication.preventable, wound_infection: @complication.wound_infection }
    end

    assert_redirected_to complication_path(assigns(:complication))
  end

  test "should show complication" do
    get :show, id: @complication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complication
    assert_response :success
  end

  test "should update complication" do
    patch :update, id: @complication, complication: { anesthesia_related: @complication.anesthesia_related, death: @complication.death, death_preventable: @complication.death_preventable, description: @complication.description, error_grade: @complication.error_grade, error_type: @complication.error_type, operation_record_id: @complication.operation_record_id, preventable: @complication.preventable, wound_infection: @complication.wound_infection }
    assert_redirected_to complication_path(assigns(:complication))
  end

  test "should destroy complication" do
    assert_difference('Complication.count', -1) do
      delete :destroy, id: @complication
    end

    assert_redirected_to complications_path
  end
end
