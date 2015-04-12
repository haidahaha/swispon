class DoctorsController < ApplicationController
  before_action :logged_in_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])
    @photos = @doctor.photos.all
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
    @photos = @doctor.photos.build
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        log_in @doctor
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_photos
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
        params[:photos]['photo'].each do |p|
          @photos = @doctor.photos.create!(:photo => p, :doctor_id => @doctor.id)
        end
        format.html { redirect_to @doctor, notice: 'Photos were successfully uploaded.' }
        format.json { render :show, status: :ok, location: @doctor }
    end
  end

  def destroy_photos
    @doctor = Doctor.find(params[:id])
    @doctor.photos.destroy_all
    respond_to do |format|
      format.html { redirect_to @doctor, notice: 'All photo were successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def create_note
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Note was successfully saved.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def logged_in_doctor
      unless logged_in?
        redirect_to login_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:name, :email, :password, :password_confirmation, :note, :photos_attributes => [:id, :doctor_id, :photo])
    end
end
