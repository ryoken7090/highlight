# frozen_string_literal: true

class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.text :high_light, null: false

      t.timestamps
    end
  end
end
