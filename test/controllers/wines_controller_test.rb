require "test_helper"

class WinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get wines_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_url
    assert_response :success
  end

  test "should create wine" do
    assert_difference("Wine.count") do
      post wines_url, params: { wine: { alcohol: @wine.alcohol, designation: @wine.designation, domain: @wine.domain, label: @wine.label, name: @wine.name, price: @wine.price, variety: @wine.variety, vendors_id: @wine.vendors_id, years: @wine.years } }
    end

    assert_redirected_to wine_url(Wine.last)
  end

  test "should show wine" do
    get wine_url(@wine)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_url(@wine)
    assert_response :success
  end

  test "should update wine" do
    patch wine_url(@wine), params: { wine: { alcohol: @wine.alcohol, designation: @wine.designation, domain: @wine.domain, label: @wine.label, name: @wine.name, price: @wine.price, variety: @wine.variety, vendors_id: @wine.vendors_id, years: @wine.years } }
    assert_redirected_to wine_url(@wine)
  end

  test "should destroy wine" do
    assert_difference("Wine.count", -1) do
      delete wine_url(@wine)
    end

    assert_redirected_to wines_url
  end
end
