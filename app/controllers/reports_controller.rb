class ReportsController < ApplicationController
    def index
        @reports = Report.finished
    end

    def show
        @report = Report.find(params[:id])
        @photos = @report.photos
        @records = @report.records
    end

    def download
        report_name = Report.find(params[:id]).patient.to_s
        send_file "public/reports/003.pdf", type: "application/pdf", status: 200
    end

    def submit
        report = Report.find(params[:id])
        report.status = "finished"
        respond_to do |format|
          if report.save
            format.html { redirect_to action: :index, notice: 'Report was successfully submitted.' }
            format.json { render :show, status: :created, location: report }
          else
            format.html { render :new }
            format.json { render json: report.errors, status: :unprocessable_entity }
          end
        end

    end

    def upload_photos
      @report = Report.find(params[:id])
      respond_to do |format|
          @photo = @report.photos.create!(:photo => params[:photo], :report_id => @report.id)
          format.html { redirect_to @report, notice: 'Photos were successfully uploaded.' }
          format.json { render json: @photo }
      end
    end

    def refresh_thumbnail
      @report = Report.find(params[:id])
      @photos = @report.photos
    end
end
