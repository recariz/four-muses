class AddColumnStatusToContestApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :contest_applications, :status, :integer, default: 0, null: false
  end
end
