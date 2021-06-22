# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'diaries/new', type: :view do
  before(:each) do
    assign(:diary, Diary.new(
                     high_light: 'MyText'
                   ))
  end

  it 'renders new diary form' do
    render

    assert_select 'form[action=?][method=?]', diaries_path, 'post' do
      assert_select 'textarea[name=?]', 'diary[high_light]'
    end
  end
end
