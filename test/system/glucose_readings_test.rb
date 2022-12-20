require "application_system_test_case"

class GlucoseReadingsTest < ApplicationSystemTestCase
  setup do
    @glucose_reading = glucose_readings(:one)
  end

  test "visiting the index" do
    visit glucose_readings_url
    assert_selector "h1", text: "Glucose Readings"
  end

  test "creating a Glucose reading" do
    visit glucose_readings_url
    click_on "New Glucose Reading"

    fill_in "Blood reading", with: @glucose_reading.blood_reading
    fill_in "Measure unit", with: @glucose_reading.measure_unit
    fill_in "Reading time", with: @glucose_reading.reading_time
    click_on "Create Glucose reading"

    assert_text "Glucose reading was successfully created"
    click_on "Back"
  end

  test "updating a Glucose reading" do
    visit glucose_readings_url
    click_on "Edit", match: :first

    fill_in "Blood reading", with: @glucose_reading.blood_reading
    fill_in "Measure unit", with: @glucose_reading.measure_unit
    fill_in "Reading time", with: @glucose_reading.reading_time
    click_on "Update Glucose reading"

    assert_text "Glucose reading was successfully updated"
    click_on "Back"
  end

  test "destroying a Glucose reading" do
    visit glucose_readings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Glucose reading was successfully destroyed"
  end
end
