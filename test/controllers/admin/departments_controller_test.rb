require 'test_helper'

class Admin::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_department = admin_departments(:one)
  end

  test "should get index" do
    get admin_departments_url, as: :json
    assert_response :success
  end

  test "should create admin_department" do
    assert_difference('Admin::Department.count') do
      post admin_departments_url, params: { admin_department: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show admin_department" do
    get admin_department_url(@admin_department), as: :json
    assert_response :success
  end

  test "should update admin_department" do
    patch admin_department_url(@admin_department), params: { admin_department: {  } }, as: :json
    assert_response 200
  end

  test "should destroy admin_department" do
    assert_difference('Admin::Department.count', -1) do
      delete admin_department_url(@admin_department), as: :json
    end

    assert_response 204
  end
end
