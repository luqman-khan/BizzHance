require 'test_helper'

class RepairsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair = repairs(:one)
  end

  test "should get index" do
    get repairs_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_url
    assert_response :success
  end

  test "should create repair" do
    assert_difference('Repair.count') do
      post repairs_url, params: { repair: { charge_note: @repair.charge_note, customer_id: @repair.customer_id, data_saving: @repair.data_saving, item_condition: @repair.item_condition, item_name: @repair.item_name, organization_id: @repair.organization_id, problem_description: @repair.problem_description, repair_description: @repair.repair_description, total_charge: @repair.total_charge, user_id: @repair.user_id } }
    end

    assert_redirected_to repair_url(Repair.last)
  end

  test "should show repair" do
    get repair_url(@repair)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_url(@repair)
    assert_response :success
  end

  test "should update repair" do
    patch repair_url(@repair), params: { repair: { charge_note: @repair.charge_note, customer_id: @repair.customer_id, data_saving: @repair.data_saving, item_condition: @repair.item_condition, item_name: @repair.item_name, organization_id: @repair.organization_id, problem_description: @repair.problem_description, repair_description: @repair.repair_description, total_charge: @repair.total_charge, user_id: @repair.user_id } }
    assert_redirected_to repair_url(@repair)
  end

  test "should destroy repair" do
    assert_difference('Repair.count', -1) do
      delete repair_url(@repair)
    end

    assert_redirected_to repairs_url
  end
end
