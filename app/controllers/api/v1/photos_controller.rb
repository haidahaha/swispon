class Api::V1::PhotosController < Api::V1::BaseController
    def show
        photo = Photo.find(params[:id])
        send_data open(photo.photo.current_path, "rb") { |f| f.read }, :status => 200, :disposition => "inline"
    end
end