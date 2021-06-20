# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'diaries/show', type: :view do
  before(:each) do
    @diary = assign(:diary, Diary.create!(
                              high_light: 'MyText'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
  end
end
