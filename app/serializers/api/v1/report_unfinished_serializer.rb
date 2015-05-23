class Api::V1::ReportUnfinishedSerializer < Api::V1::BaseSerializer
    attributes :id, :patient, :date

    def date
        created_at
    end
end