class GlucoseReadingsController < ApplicationController
  before_action :set_glucose_reading, only: %i[ show edit update destroy ]

  # GET /glucose_readings or /glucose_readings.json
  def index
    @glucose_readings = current_user.glucose_readings.today_report
  end

  # GET /glucose_readings/1 or /glucose_readings/1.json
  def show; end

  # GET /glucose_readings/new
  def new
    @glucose_reading = current_user.glucose_readings.new
  end

  # GET /glucose_readings/1/edit
  def edit; end

  # POST /glucose_readings or /glucose_readings.json
  def create
    @glucose_reading = current_user.glucose_readings.new(glucose_reading_params)
    glucose_reading_record = current_user.glucose_readings.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_day, Time.now.end_of_day)
    if glucose_reading_record.count >= 4 then @glucose_reading.errors.add(:base, "Limit Exceeded") end
    if @glucose_reading.errors.any?
      render "new"
      return
    else
      respond_to do |format|
        if @glucose_reading.save
          format.html { redirect_to glucose_reading_url(@glucose_reading), notice: "Glucose reading was successfully created." }
          format.json { render :show, status: :created, location: @glucose_reading }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @glucose_reading.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /glucose_readings/1 or /glucose_readings/1.json
  def update
    respond_to do |format|
      if @glucose_reading.update(glucose_reading_params)
        format.html { redirect_to glucose_reading_url(@glucose_reading), notice: "Glucose reading was successfully updated." }
        format.json { render :show, status: :ok, location: @glucose_reading }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @glucose_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glucose_readings/1 or /glucose_readings/1.json
  def destroy
    @glucose_reading.destroy

    respond_to do |format|
      format.html { redirect_to glucose_readings_url, notice: "Glucose reading was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glucose_reading
      @glucose_reading = GlucoseReading.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def glucose_reading_params
      params.require(:glucose_reading).permit(:blood_reading, :reading_time, :measure_unit)
    end
end
