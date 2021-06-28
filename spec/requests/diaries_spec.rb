# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/diaries', type: :request do
  let(:valid_attributes) { FactoryBot.attributes_for(:diary) }
  let(:invalid_attributes) { { high_light: '' } }

  describe 'GET /index' do
    let!(:diary) { create :diary }

    it 'renders a successful response' do
      get diaries_url
      expect(response).to be_successful
      expect(response.body).to include diary.high_light
    end
  end

  describe 'GET /show' do
    let!(:diary) { create :diary }

    it 'renders a successful response' do
      get diary_url(diary)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_diary_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:diary) { create :diary }

    it 'render a successful response' do
      get edit_diary_url(diary)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Diary' do
        expect do
          post diaries_url, params: { diary: valid_attributes }
        end.to change(Diary, :count).by(1)
      end

      it 'redirects to the created diary' do
        post diaries_url, params: { diary: valid_attributes }
        expect(response).to redirect_to(diary_url(Diary.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Diary' do
        expect do
          post diaries_url, params: { diary: invalid_attributes }
        end.to change(Diary, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post diaries_url, params: { diary: invalid_attributes }
        expect(response).to have_http_status '422'
        # expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { high_light: 'NewText' } }

      it 'updates the requested diary' do
        diary = Diary.create! valid_attributes
        patch diary_url(diary), params: { diary: new_attributes }
        diary.reload
        expect(diary.high_light).to eq new_attributes[:high_light]
      end

      it 'redirects to the diary' do
        diary = Diary.create! valid_attributes
        patch diary_url(diary), params: { diary: new_attributes }
        diary.reload
        expect(response).to redirect_to(diary_url(diary))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        diary = Diary.create! valid_attributes
        patch diary_url(diary), params: { diary: invalid_attributes }
        expect(response).to have_http_status '422'
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested diary' do
      diary = Diary.create! valid_attributes
      expect do
        delete diary_url(diary)
      end.to change(Diary, :count).by(-1)
    end

    it 'redirects to the diaries list' do
      diary = Diary.create! valid_attributes
      delete diary_url(diary)
      expect(response).to redirect_to(diaries_url)
    end
  end
end
