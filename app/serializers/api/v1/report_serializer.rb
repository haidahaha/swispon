class Api::V1::ReportSerializer < Api::V1::BaseSerializer
    attributes :id, :patient, :data, :date

    has_many :records, key: :records
    has_many :photos, key: :photos

    def data
        "unknown"
    end

    def date
        created_at
    end


end

