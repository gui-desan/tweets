require 'test_helper'

class Tweets::RetweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tweets_retweets_new_url
    assert_response :success
  end

  test "should get create" do
    get tweets_retweets_create_url
    assert_response :success
  end

end
