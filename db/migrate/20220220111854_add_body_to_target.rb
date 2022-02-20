class AddBodyToTarget < ActiveRecord::Migration[5.2]
  def change
    add_column :targets, :body, :string
    add_column :targets, :image_id, :string
    add_column :targets, :result, :boolean
    add_column :targets, :feedback, :string
  end
end
