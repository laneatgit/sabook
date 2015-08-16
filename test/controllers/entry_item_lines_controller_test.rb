require 'test_helper'

class EntryItemLinesControllerTest < ActionController::TestCase
  setup do
    @entry_item_line = entry_item_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_item_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry_item_line" do
    assert_difference('EntryItemLine.count') do
      post :create, entry_item_line: { amount: @entry_item_line.amount, direction: @entry_item_line.direction, entry_item_id: @entry_item_line.entry_item_id, subject_id: @entry_item_line.subject_id }
    end

    assert_redirected_to entry_item_line_path(assigns(:entry_item_line))
  end

  test "should show entry_item_line" do
    get :show, id: @entry_item_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry_item_line
    assert_response :success
  end

  test "should update entry_item_line" do
    patch :update, id: @entry_item_line, entry_item_line: { amount: @entry_item_line.amount, direction: @entry_item_line.direction, entry_item_id: @entry_item_line.entry_item_id, subject_id: @entry_item_line.subject_id }
    assert_redirected_to entry_item_line_path(assigns(:entry_item_line))
  end

  test "should destroy entry_item_line" do
    assert_difference('EntryItemLine.count', -1) do
      delete :destroy, id: @entry_item_line
    end

    assert_redirected_to entry_item_lines_path
  end
end
