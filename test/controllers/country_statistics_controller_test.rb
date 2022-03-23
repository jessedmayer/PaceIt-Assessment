require "test_helper"

class CountryStatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get country_statistics_index_url
    assert_response :success
  end
end
