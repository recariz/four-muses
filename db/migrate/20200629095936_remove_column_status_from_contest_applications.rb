class RemoveColumnStatusFromContestApplications < ActiveRecord::Migration[6.0]
  def change
    remove_column :contest_applications, :status, :string
  end
end
