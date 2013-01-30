class AddThanhtienToXoso < ActiveRecord::Migration
  def change
    add_column :xosos, :thanhtien, :integer
  end
end
