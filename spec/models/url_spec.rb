require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { FactoryBot.create(:url) }

  describe 'ActiveModel validations' do
    it { is_expected.to validate_presence_of(:full_url) }
    it { is_expected.to validate_uniqueness_of(:full_url) }
  end

  describe 'public class methods' do
    describe '#most_popular' do
      before(:each) do
        0.upto(200) do
          FactoryBot.create(:url, hit_counter: rand(60))
        end
      end

      context 'without parameters' do
        it 'should return 100 urls' do
          expect(Url.most_popular.count).to match(100)
        end

        it 'should return 100 most popular urls in decrescent order' do
          expect(Url.most_popular.first).to match(Url.order(hit_counter: :desc).first)
        end
      end
      context 'with 50 as the parameter' do
        it 'should return the 50 most popular urls in decrescent order' do
          expect(Url.most_popular(50)).to match(Url.order(hit_counter: :desc).limit(50))
        end
      end
    end
  end

  describe 'private instance methods' do
    describe '#shorten_url' do
      it 'should shorten the full_url and save it to short_url with lenght <= 6' do
        expect(url.short_url.length).to be <= 6
      end
    end
  end
end
