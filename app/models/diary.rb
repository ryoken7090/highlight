# frozen_string_literal: true

class Diary < ApplicationRecord
  validates :high_light, presence: true
  validates :concentration, presence: true
  validates :concentration, inclusion: { in: 1..10 }
  validates :energy, presence: true
  validates :energy, inclusion: { in: 1..10 }
  validates :reflection, exclusion: { in: [nil] }
  validates :thanks, exclusion: { in: [nil] }
  validates :date, presence: true
  has_many :tried_strategies, dependent: :destroy

  # TriedStrategyモデルに対しhas_many :tried_strategies とアソシエーションメソッドを定義すると
  # diaryレコードに紐づくstrategyをdiary.tried_strategiesと呼び出せなくなってしまうので
  # tried_strategiesモデルに異なるアソシエーション名(仮にrelay_recordsとした)をつかった.
  has_many :relay_records, class_name: 'TriedStrategy', foreign_key: 'diary_id'
  has_many :tried_strategies, through: :relay_records, source: :strategy
end
