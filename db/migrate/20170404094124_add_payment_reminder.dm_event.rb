# This migration comes from dm_event (originally 20131127165445)
class AddPaymentReminder < ActiveRecord::Migration
  def change
    add_column   :ems_registrations, :payment_reminder_sent_on, :datetime, :default => nil
  end
end
