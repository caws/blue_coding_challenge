class AddStatusToUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :status, :integer, default: 0
  end
end
