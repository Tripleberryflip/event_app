require 'test_helper'

class ScoreTemplatesControllerTest < ActionController::TestCase
  setup do
    @score_template = score_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_template" do
    assert_difference('ScoreTemplate.count') do
      post :create, score_template: {  }
    end

    assert_redirected_to score_template_path(assigns(:score_template))
  end

  test "should show score_template" do
    get :show, id: @score_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_template
    assert_response :success
  end

  test "should update score_template" do
    put :update, id: @score_template, score_template: {  }
    assert_redirected_to score_template_path(assigns(:score_template))
  end

  test "should destroy score_template" do
    assert_difference('ScoreTemplate.count', -1) do
      delete :destroy, id: @score_template
    end

    assert_redirected_to score_templates_path
  end
end
