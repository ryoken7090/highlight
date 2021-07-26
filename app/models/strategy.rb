# frozen_string_literal: true

class Strategy < ApplicationRecord
  validates :title, presence: true
end
