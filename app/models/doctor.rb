class Doctor < ActiveRecord::Base
    has_many :photos, dependent: :destroy
    accepts_nested_attributes_for :photos
    has_secure_password
end
