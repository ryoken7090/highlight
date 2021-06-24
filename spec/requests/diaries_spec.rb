# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/diaries', type: :request do
  describe 'GET /index' do
    let!(:diary) { create :diary }

    it 'renders a successful response' do
      get diaries_url
      expect(response).to be_successful
      expect(response.body).to include diary.high_light
    end
  end

  xdescribe 'GET /show' do
    it 'renders a successful response' do
      diary = Diary.create! valid_attributes
      get diary_url(diary)
      expect(response).to be_successful
    end
  end

  xdescribe 'GET /new' do
    it 'renders a successful response' do
      get new_diary_url
      expect(response).to be_successful
    end
  end

  xdescribe 'GET /edit' do
    it 'render a successful response' do
      diary = Diary.create! valid_attributes
      get edit_diary_url(diary)
      expect(response).to be_successful
    end
  end

  xdescribe 'POST /create' do
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
        expect(response).to be_successful
      end
    end
  end

  xdescribe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested diary' do
        diary = Diary.create! valid_attributes
        patch diary_url(diary), params: { diary: new_attributes }
        diary.reload
        skip('Add assertions for updated state')
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
        expect(response).to be_successful
      end
    end
  end

  xdescribe 'DELETE /destroy' do
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
