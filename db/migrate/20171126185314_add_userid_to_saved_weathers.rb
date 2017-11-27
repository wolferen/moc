# frozen_string_literal: true

class AddUseridToSavedWeathers < ActiveRecord::Migration[5.1]
  def change
    add_reference :saved_weathers, :user, foreign_key: true
  end
end
