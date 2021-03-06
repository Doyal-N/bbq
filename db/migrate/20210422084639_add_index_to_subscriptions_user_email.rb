# frozen_string_literal: true

class AddIndexToSubscriptionsUserEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :subscriptions, %i[user_email event_id], unique: true
    add_index :subscriptions, %i[user_id event_id], unique: true
  end
end
