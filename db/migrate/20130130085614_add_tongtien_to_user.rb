class AddTongtienToUser < ActiveRecord::Migration
  def change
    add_column :users, :tongtien, :integer
  end
end
