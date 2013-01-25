class AddUserIdToXoso < ActiveRecord::Migration
  def change
    add_column :xosos, :user_id, :integer
  end
end
