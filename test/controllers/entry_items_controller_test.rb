require 'test_helper'

class EntryItemsControllerTest < ActionController::TestCase
  setup do
    @entry_item = entry_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry_item" do
    assert_difference('EntryItem.count') do
      post :create, entry_item: { credit_amount: @entry_item.credit_amount, credit_subject_id: @entry_item.credit_subject_id, debit_amount: @entry_item.debit_amount, debit_subject_id: @entry_item.debit_subject_id, entry_date: @entry_item.entry_date, explanation: @entry_item.explanation }
    end

    assert_redirected_to entry_item_path(assigns(:entry_item))
  end

  test "should show entry_item" do
    get :show, id: @entry_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry_item
    assert_response :success
  end

  test "should update entry_item" do
    patch :update, id: @entry_item, entry_item: { credit_amount: @entry_item.credit_amount, credit_subject_id: @entry_item.credit_subject_id, debit_amount: @entry_item.debit_amount, debit_subject_id: @entry_item.debit_subject_id, entry_date: @entry_item.entry_date, explanation: @entry_item.explanation }
    assert_redirected_to entry_item_path(assigns(:entry_item))
  end

  test "should destroy entry_item" do
    assert_difference('EntryItem.count', -1) do
      delete :destroy, id: @entry_item
    end

    assert_redirected_to entry_items_path
  end
end
