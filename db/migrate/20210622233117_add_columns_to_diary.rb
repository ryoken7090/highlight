# frozen_string_literal: true

class AddColumnsToDiary < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :concentration, :integer, null: false, comment: 'その日の集中力を10段階で評価'
    add_column :diaries, :energy, :integer, null: false, comment: 'その日に注げたエネルギーを10段階で評価'
    add_column :diaries, :reflection, :text, null: false, default: '', comment: 'その日の反省'
    add_column :diaries, :thanks, :text, null: false, default: '', comment: 'その日誰かに感謝したこと'
    add_column :diaries, :date, :datetime, null: false, index: { unique: true }, comment: '日付'
  end
end
