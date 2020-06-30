class AddColumnsToContestApplications < ActiveRecord::Migration[6.0]
  def change
    change_table :contest_applications do |t|
    t.monetize :amount, currency: { present: false }
    t.string :checkout_session_id
  end
end
end
