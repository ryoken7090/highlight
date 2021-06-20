# frozen_string_literal: true

json.extract! diary, :id, :high_light, :created_at, :updated_at
json.url diary_url(diary, format: :json)
