# frozen_string_literal: true

json.array! @diaries, partial: 'diaries/diary', as: :diary
