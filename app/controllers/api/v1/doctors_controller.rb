class Api::V1::DoctorsController < Api::V1::BaseController
  def show
    doctor = Doctor.find(params[:id])

    render json: doctor
  end
end