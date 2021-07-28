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
  has_many :tried_strategy_references, dependent: :destroy
  has_many :tried_strategies, through: :tried_strategy_references, source: :strategy
end
