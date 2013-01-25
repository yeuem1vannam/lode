class CreateXosos < ActiveRecord::Migration
  def change
    create_table :xosos do |t|
      t.integer :so
      t.string :type
      t.integer :diem

      t.timestamps
    end
  end
end
