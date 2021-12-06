require 'test_helper'

class MylistNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mylist_names_new_url
    assert_response :success
  end

  test "should get create" do
    get mylist_names_create_url
    assert_response :success
  end

end
