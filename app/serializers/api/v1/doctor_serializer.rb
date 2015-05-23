class Api::V1::DoctorSerializer < Api::V1::BaseSerializer
    attributes :id

    has_many :reports
end