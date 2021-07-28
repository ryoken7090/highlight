# frozen_string_literal: true

class TriedStrategyReference < ApplicationRecord
  belongs_to :diary
  belongs_to :strategy
end
