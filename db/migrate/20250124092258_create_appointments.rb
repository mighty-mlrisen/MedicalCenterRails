class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.date :appointment_date
      t.text :diagnosis
      t.text :notes

      t.timestamps
    end
  end
end
