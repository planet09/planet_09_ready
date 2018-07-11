require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { amount: @order.amount, del_addr: @order.del_addr, del_pay: @order.del_pay, detail_addr: @order.detail_addr, invoice_code: @order.invoice_code, o_id: @order.o_id, or_time: @order.or_time, pay_time: @order.pay_time, post_code: @order.post_code, total_pay: @order.total_pay }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { amount: @order.amount, del_addr: @order.del_addr, del_pay: @order.del_pay, detail_addr: @order.detail_addr, invoice_code: @order.invoice_code, o_id: @order.o_id, or_time: @order.or_time, pay_time: @order.pay_time, post_code: @order.post_code, total_pay: @order.total_pay }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
