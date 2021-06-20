# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'diaries/index', type: :view do
  before(:each) do
    assign(:diaries, [
             Diary.create!(
               high_light: 'MyText'
             ),
             Diary.create!(
               high_light: 'MyText'
             )
           ])
  end

  it 'renders a list of diaries' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
