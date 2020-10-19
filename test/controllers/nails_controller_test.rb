require 'test_helper'

class NailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nail = nails(:one)
  end

  test "should get index" do
    get nails_url
    assert_response :success
  end

  test "should get new" do
    get new_nail_url
    assert_response :success
  end

  test "should create nail" do
    assert_difference('Nail.count') do
      post nails_url, params: { nail: { brand: @nail.brand, image_id: @nail.image_id, introduction: @nail.introduction, name: @nail.name, price: @nail.price, relationship_id: @nail.relationship_id, user_id: @nail.user_id } }
    end

    assert_redirected_to nail_url(Nail.last)
  end

  test "should show nail" do
    get nail_url(@nail)
    assert_response :success
  end

  test "should get edit" do
    get edit_nail_url(@nail)
    assert_response :success
  end

  test "should update nail" do
    patch nail_url(@nail), params: { nail: { brand: @nail.brand, image_id: @nail.image_id, introduction: @nail.introduction, name: @nail.name, price: @nail.price, relationship_id: @nail.relationship_id, user_id: @nail.user_id } }
    assert_redirected_to nail_url(@nail)
  end

  test "should destroy nail" do
    assert_difference('Nail.count', -1) do
      delete nail_url(@nail)
    end

    assert_redirected_to nails_url
  end
end
