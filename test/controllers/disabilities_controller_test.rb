require "test_helper"

class DisabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disability = disabilities(:one)
  end

  test "should get index" do
    get disabilities_url, as: :json
    assert_response :success
  end

  test "should create disability" do
    assert_difference('Disability.count') do
      post disabilities_url, params: { disability: { name: @disability.name } }, as: :json
    end

    assert_response 201
  end

  test "should show disability" do
    get disability_url(@disability), as: :json
    assert_response :success
  end

  test "should update disability" do
    patch disability_url(@disability), params: { disability: { name: @disability.name } }, as: :json
    assert_response 200
  end

  test "should destroy disability" do
    assert_difference('Disability.count', -1) do
      delete disability_url(@disability), as: :json
    end

    assert_response 204
  end
end
