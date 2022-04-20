require 'test_helper'

class Admin::FacultiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_faculty = admin_faculties(:one)
  end

  test "should get index" do
    get admin_faculties_url, as: :json
    assert_response :success
  end

  test "should create admin_faculty" do
    assert_difference('Admin::Faculty.count') do
      post admin_faculties_url, params: { admin_faculty: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show admin_faculty" do
    get admin_faculty_url(@admin_faculty), as: :json
    assert_response :success
  end

  test "should update admin_faculty" do
    patch admin_faculty_url(@admin_faculty), params: { admin_faculty: {  } }, as: :json
    assert_response 200
  end

  test "should destroy admin_faculty" do
    assert_difference('Admin::Faculty.count', -1) do
      delete admin_faculty_url(@admin_faculty), as: :json
    end

    assert_response 204
  end
end
