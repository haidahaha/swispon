class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :type
      t.int :length
      t.boolean :transcribed
      t.references :report, index: true
      t.text :note

      t.timestamps
    end
  end
end
