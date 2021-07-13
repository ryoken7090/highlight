# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe "Validation" do
    describe ".high_light" do
      let(:diary) { build :diary, high_light: high_light }

      subject { diary }

      context "nil" do
        let(:high_light) { nil }

        it { is_expected.to be_invalid }
      end

      context "空文字" do
        let(:high_light) { "" }

        it { is_expected.to be_invalid }
      end

      context "文字列" do
        let(:high_light) { "text" }

        it { is_expected.to be_valid }
      end
    end
  end
end
