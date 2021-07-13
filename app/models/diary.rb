# frozen_string_literal: true

class Diary < ApplicationRecord
  validates :high_light, presence: true
  validates :concentration, presence: true
  validates :concentration, inclusion: { in: 1..10 }
  validates :energy, presence: true
  validates :energy, inclusion: { in: 1..10 }
  validates :date, presence: true
end
