class AddNoteToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :note, :text
  end
end
