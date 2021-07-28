# frozen_string_literal: true

class Strategy < ApplicationRecord
  validates :title, presence: true
  has_many :tried_strategy_references, dependent: :destroy
  has_many :tried_diaries, through: :tried_strategy_references, source: :diary
end
