class Report < ActiveRecord::Base
  belongs_to :doctor
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  has_many :records, dependent: :destroy

  scope :finished, -> { where(status: "finished") }
  scope :unfinished, -> { where(status: "unfinished") }


  # API
  def self.createReport(doctor_id, date, patient)
      Doctor.find(doctor_id).reports.create(
          patient: patient,
          status: "unfinished",
          created_at: date
      )
  end
end
