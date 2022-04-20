require 'test_helper'

class Admin::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_course = admin_courses(:one)
  end

  test "should get index" do
    get admin_courses_url, as: :json
    assert_response :success
  end

  test "should create admin_course" do
    assert_difference('Admin::Course.count') do
      post admin_courses_url, params: { admin_course: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show admin_course" do
    get admin_course_url(@admin_course), as: :json
    assert_response :success
  end

  test "should update admin_course" do
    patch admin_course_url(@admin_course), params: { admin_course: {  } }, as: :json
    assert_response 200
  end

  test "should destroy admin_course" do
    assert_difference('Admin::Course.count', -1) do
      delete admin_course_url(@admin_course), as: :json
    end

    assert_response 204
  end
end
