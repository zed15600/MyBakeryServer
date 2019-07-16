require 'test_helper'

class FeedstocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedstocks_index_url
    assert_response :success
  end

  test "should get show" do
    get feedstocks_show_url
    assert_response :success
  end

  test "should get new" do
    get feedstocks_new_url
    assert_response :success
  end

  test "should get edit" do
    get feedstocks_edit_url
    assert_response :success
  end

  test "should get create" do
    get feedstocks_create_url
    assert_response :success
  end

  test "should get update" do
    get feedstocks_update_url
    assert_response :success
  end

end
