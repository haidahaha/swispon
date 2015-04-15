class ReportsController < ApplicationController
    def index
        @reports = Report.where(status: params[:status])
        @status = params[:status]
    end

    def show
        @report = Report.find(params[:id])
        @photos = @report.photos
        @records = @report.records
    end

    def download
        report_name = Report.find(params[:id]).patientID.to_s
        send_file "public/reports/#{report_name}.pdf", type: "application/pdf", status: 200
    end

    def upload_photos
      @report = Report.find(params[:id])
      respond_to do |format|
          params[:photos]['photo'].each do |p|
            @photos = @report.photos.create!(:photo => p, :report_id => @report.id)
          end
          format.html { redirect_to @report, notice: 'Photos were successfully uploaded.' }
          format.json { render :show, status: :ok, location: @report }
      end
    end

    def destroy_photos
      @report = Report.find(params[:id])
      @report.photos.destroy_all
      respond_to do |format|
        format.html { redirect_to @report, notice: 'All photos were successfully deleted.' }
        format.json { head :no_content }
      end
    end
end
