class Api::V1::RecordsController < Api::V1::BaseController
    def showAudio
        record = Record.find(params[:id])
        send_data open(record.file.current_path, "rb") { |f| f.read }, :status => 200
    end

    def createAudio
        report = Report.find(params[:report_id])
        record = report.records.create(
            file: params[:audioFile]
        )
        render json: record
    end
end