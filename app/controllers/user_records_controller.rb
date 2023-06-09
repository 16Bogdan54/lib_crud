class UserRecordsController < ApplicationController
  before_action :set_user_record, only: %i[ show edit update destroy ]

  # GET /user_records or /user_records.json
  def index
    @user_records = UserRecord.page(params[:page] || 1).per(5)

    respond_to do |format|
      format.html # Render the default HTML template
      format.json { render json: @user_records } # Render JSON data for API requests
    end
  end
  # GET /user_records/1 or /user_records/1.json
  def show
  end

  # GET /user_records/new
  def new
    @user_record = UserRecord.new
  end

  # GET /user_records/1/edit
  def edit
  end

  # POST /user_records or /user_records.json
  def create
    @user_record = UserRecord.new(user_record_params)

    respond_to do |format|
      if @user_record.save
        format.html { redirect_to user_record_url(@user_record), notice: "User record was successfully created." }
        format.json { render :show, status: :created, location: @user_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_records/1 or /user_records/1.json
  def update
    respond_to do |format|
      if @user_record.update(user_record_params)
        format.html { redirect_to user_record_url(@user_record), notice: "User record was successfully updated." }
        format.json { render :show, status: :ok, location: @user_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_records/1 or /user_records/1.json
  def destroy
    @user_record.destroy

    respond_to do |format|
      format.html { redirect_to user_records_url, notice: "User record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_record
      @user_record = UserRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_record_params
      params.require(:user_record).permit(:library_id, :user_id)
    end
end
