# frozen_string_literal: true

class Diary < ApplicationRecord
  validates :high_light, presence: true
end
