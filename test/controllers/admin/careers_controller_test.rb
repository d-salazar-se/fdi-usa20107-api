require 'test_helper'

class Admin::CareersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_career = admin_careers(:one)
  end

  test "should get index" do
    get admin_careers_url, as: :json
    assert_response :success
  end

  test "should create admin_career" do
    assert_difference('Admin::Career.count') do
      post admin_careers_url, params: { admin_career: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show admin_career" do
    get admin_career_url(@admin_career), as: :json
    assert_response :success
  end

  test "should update admin_career" do
    patch admin_career_url(@admin_career), params: { admin_career: {  } }, as: :json
    assert_response 200
  end

  test "should destroy admin_career" do
    assert_difference('Admin::Career.count', -1) do
      delete admin_career_url(@admin_career), as: :json
    end

    assert_response 204
  end
end
