# frozen_string_literal: true

class TriedStrategy < ApplicationRecord
  belongs_to :diary
  belongs_to :strategy
end
