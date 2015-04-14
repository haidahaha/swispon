class Doctor < ActiveRecord::Base
    has_many :reports, dependent: :destroy
    has_secure_password
end
