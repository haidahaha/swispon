class ChangePatientIdToPatientInReports < ActiveRecord::Migration
  def change
    rename_column :reports, :patientID, :patient
  end
end
