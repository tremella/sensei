require "test_helper"

class SlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get slots_create_url
    assert_response :success
  end

  test "should get book" do
    get slots_book_url
    assert_response :success
  end

  test "should get destroy" do
    get slots_destroy_url
    assert_response :success
  end
end
