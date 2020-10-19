require "application_system_test_case"

class NailsTest < ApplicationSystemTestCase
  setup do
    @nail = nails(:one)
  end

  test "visiting the index" do
    visit nails_url
    assert_selector "h1", text: "Nails"
  end

  test "creating a Nail" do
    visit nails_url
    click_on "New Nail"

    fill_in "Brand", with: @nail.brand
    fill_in "Image", with: @nail.image_id
    fill_in "Introduction", with: @nail.introduction
    fill_in "Name", with: @nail.name
    fill_in "Price", with: @nail.price
    fill_in "Relationship", with: @nail.relationship_id
    fill_in "User", with: @nail.user_id
    click_on "Create Nail"

    assert_text "Nail was successfully created"
    click_on "Back"
  end

  test "updating a Nail" do
    visit nails_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @nail.brand
    fill_in "Image", with: @nail.image_id
    fill_in "Introduction", with: @nail.introduction
    fill_in "Name", with: @nail.name
    fill_in "Price", with: @nail.price
    fill_in "Relationship", with: @nail.relationship_id
    fill_in "User", with: @nail.user_id
    click_on "Update Nail"

    assert_text "Nail was successfully updated"
    click_on "Back"
  end

  test "destroying a Nail" do
    visit nails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nail was successfully destroyed"
  end
end
