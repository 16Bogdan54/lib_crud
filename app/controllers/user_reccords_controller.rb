class UserReccordsController < ApplicationController
  before_action :set_user_reccord, only: %i[ show edit update destroy ]

  # GET /user_records or /user_records.json
  def index
    @user_reccords = UserReccord.all
  end

  # GET /user_records/1 or /user_records/1.json
  def show
  end

  # GET /user_records/new
  def new
    @user_reccord = UserReccord.new
  end

  # GET /user_records/1/edit
  def edit
  end

  # POST /user_records or /user_records.json
  def create
    @user_reccord = UserReccord.new(user_reccord_params)

    respond_to do |format|
      if @user_reccord.save
        format.html { redirect_to user_reccord_url(@user_reccord), notice: "User reccord was successfully created." }
        format.json { render :show, status: :created, location: @user_reccord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_reccord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_records/1 or /user_records/1.json
  def update
    respond_to do |format|
      if @user_reccord.update(user_reccord_params)
        format.html { redirect_to user_reccord_url(@user_reccord), notice: "User reccord was successfully updated." }
        format.json { render :show, status: :ok, location: @user_reccord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_reccord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_records/1 or /user_records/1.json
  def destroy
    @user_reccord.destroy

    respond_to do |format|
      format.html { redirect_to user_reccords_url, notice: "User reccord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_reccord
      @user_reccord = UserReccord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_reccord_params
      params.require(:user_reccord).permit(:library_id, :user_id)
    end
end
