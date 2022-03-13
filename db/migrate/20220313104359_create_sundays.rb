class CreateSundays < ActiveRecord::Migration[7.0]
  def change
    create_table :sundays do |t|
      t.boolean :sunny

      t.timestamps
    end
  end
end
