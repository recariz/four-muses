class RemoveIntegerFromContestApplications < ActiveRecord::Migration[6.0]
  def change
    remove_column :contest_applications, :integer, :string
  end
end
