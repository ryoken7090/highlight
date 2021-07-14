# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe 'Validation' do
    describe '.high_light' do
      let(:diary) { build :diary, high_light: high_light }

      subject { diary }

      context 'nil' do
        let(:high_light) { nil }

        it { is_expected.to be_invalid }
      end

      context '空文字' do
        let(:high_light) { '' }

        it { is_expected.to be_invalid }
      end

      context '文字列' do
        let(:high_light) { 'text' }

        it { is_expected.to be_valid }
      end
    end
    describe '.concentration' do
      let(:diary) { build :diary, concentration: concentration }

      subject { diary }

      context 'nil' do
        let(:concentration) { nil }

        it { is_expected.to be_invalid }
      end

      context 'less than 1' do
        let(:concentration) { 0 }

        it { is_expected.to be_invalid }
      end

      context 'bigger than 10' do
        let(:concentration) { 11 }

        it { is_expected.to be_invalid }
      end

      context 'less than 1' do
        let(:concentration) { 0 }

        it { is_expected.to be_invalid }
      end

      context '文字列' do
        let(:concentration) { 'よん' }

        it { is_expected.to be_invalid }
      end

      context '1~10' do
        let(:concentration) { (1..10).to_a.sample }

        it { is_expected.to be_valid }
      end
    end
  end
end
