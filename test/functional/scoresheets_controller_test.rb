require 'test_helper'

class ScoreSheetsControllerTest < ActionController::TestCase
  setup do
    @score_sheet = score_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_sheet" do
    assert_difference('ScoreSheet.count') do
      post :create, score_sheet: { name: @score_sheet.name }
    end

    assert_redirected_to score_sheet_path(assigns(:score_sheet))
  end

  test "should show score_sheet" do
    get :show, id: @score_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_sheet
    assert_response :success
  end

  test "should update score_sheet" do
    put :update, id: @score_sheet, score_sheet: { name: @score_sheet.name }
    assert_redirected_to score_sheet_path(assigns(:score_sheet))
  end

  test "should destroy score_sheet" do
    assert_difference('ScoreSheet.count', -1) do
      delete :destroy, id: @score_sheet
    end

    assert_redirected_to score_sheets_path
  end
end
