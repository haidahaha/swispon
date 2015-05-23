class Api::V1::ReportsController < Api::V1::BaseController
    def show
        report = Report.find(params[:id])
        render json: report
    end

    def indexUnfinished
        reports = Report.unfinished
        render json: reports, each_serializer: ReportUnfinishedSerializer
    end

    def create
        date = params[:date] || Time.now
        patient = params[:patient]
        doctor_id = params[:doctor_id]

        report = Report.createReport(doctor_id, date, patient)

        render json: report
    end

    def update
        report = Report.find(params[:id])
        attrs = JSON.parse(params[:json])
        report.update(attrs)
        render json: report
    end
end