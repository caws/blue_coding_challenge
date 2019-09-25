require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { build(:url) }

  describe 'ActiveModel validations' do
    it { is_expected.to validate_presence_of(:short_url) }
    it { is_expected.to validate_presence_of(:full_url) }
    it { is_expected.to validate_uniqueness_of(:short_url) }
    it { is_expected.to validate_uniqueness_of(:full_url) }
  end

  describe 'methods' do
    context '#shorten_url' do
      it { expect(url.short_url.length).to be <= 6 }
    end
  end
end
