# frozen_string_literal: true

class CreateSavedWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_weathers do |t|
      t.string 'search_city'
      t.string 'yahoo_title'
      t.string 'yahoo_temp'
      t.string 'yahoo_text'
      t.string 'owm_min'
      t.string 'owm_max'
      t.string 'owm_cloud'

      t.timestamps
    end
  end
end
