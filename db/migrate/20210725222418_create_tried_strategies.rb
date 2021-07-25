# frozen_string_literal: true

class CreateTriedStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :tried_strategies do |t|
      t.references :diary, foreign_key: true
      t.references :strategy, foreign_key: true

      t.timestamps
    end
  end
end