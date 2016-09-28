class CreateCurrentWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :current_weathers do |t|
      t.string :description
      t.decimal :temperature
      t.decimal :precipitation
      t.decimal :windspeed

      t.timestamps
    end
  end
end
