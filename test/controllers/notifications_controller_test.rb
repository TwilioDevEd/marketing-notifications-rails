require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  # From fixtures there are 2 numbers in the database 555-5555, 555-5556

  test 'when subscriber does not exist then response should contains thanks message' do
    get :incoming, From: '555-5581'
    assert_response :success
    assert_contains("Thanks", xpath_content(response, '//Response//Message'))
  end

  test 'when subscriber exist then response should contains sorry message' do
    get :incoming, From: '555-5555'
    assert_response :success
    assert_contains("Sorry", xpath_content(response, '//Response//Message'))
  end

  test 'when subscriber exist and request contains subscribe then response should contains subscribed message' do
    get :incoming, From: '555-5555', Body: 'add'
    assert_response :success
    assert_contains("subscribed", xpath_content(response, '//Response//Message'))
  end

  test 'when subscriber exist and request contains unsubscribe then response should contains unsubscribed message' do
    get :incoming, From: '555-5555', Body: 'remove'
    assert_response :success
    assert_contains("unsubscribed", xpath_content(response, '//Response//Message'))
  end

  private

  def assert_contains(expected_substring, string, *args)
    assert_match expected_substring, string, *args
  end

  def xpath_content(response, xpath)
    xml = Nokogiri::XML(response.body)
    xml.at_xpath(xpath).content
  end
end
