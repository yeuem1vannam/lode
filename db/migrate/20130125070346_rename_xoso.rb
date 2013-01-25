class RenameXoso < ActiveRecord::Migration
  def change
    rename_column :xosos, :type, :loai
  end
end
