require "test_helper"

class GlucoseReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glucose_reading = glucose_readings(:one)
  end

  test "should get index" do
    get glucose_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_glucose_reading_url
    assert_response :success
  end

  test "should create glucose_reading" do
    assert_difference('GlucoseReading.count') do
      post glucose_readings_url, params: { glucose_reading: { blood_reading: @glucose_reading.blood_reading, measure_unit: @glucose_reading.measure_unit, reading_time: @glucose_reading.reading_time } }
    end

    assert_redirected_to glucose_reading_url(GlucoseReading.last)
  end

  test "should show glucose_reading" do
    get glucose_reading_url(@glucose_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_glucose_reading_url(@glucose_reading)
    assert_response :success
  end

  test "should update glucose_reading" do
    patch glucose_reading_url(@glucose_reading), params: { glucose_reading: { blood_reading: @glucose_reading.blood_reading, measure_unit: @glucose_reading.measure_unit, reading_time: @glucose_reading.reading_time } }
    assert_redirected_to glucose_reading_url(@glucose_reading)
  end

  test "should destroy glucose_reading" do
    assert_difference('GlucoseReading.count', -1) do
      delete glucose_reading_url(@glucose_reading)
    end

    assert_redirected_to glucose_readings_url
  end
end
