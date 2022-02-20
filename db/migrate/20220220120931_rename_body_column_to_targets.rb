class RenameBodyColumnToTargets < ActiveRecord::Migration[5.2]
  def change
    rename_column :targets, :body, :detail
  end
end
