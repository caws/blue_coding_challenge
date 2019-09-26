require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { FactoryBot.create(:url) }

  describe 'ActiveModel validations' do
    it { is_expected.to validate_presence_of(:full_url) }
    it { is_expected.to validate_uniqueness_of(:full_url) }
  end

  describe 'public class methods' do
    describe '#most_popular' do
      before(:all) do
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

  describe 'public instance methods' do
    describe '#pull_title_and_set_status' do
      it 'should update the url status' do
        previous_status = url.status
        url.pull_title_and_set_status
        expect(Url.most_popular(50)).not_to be(previous_status)
      end
    end

    describe '#increase_hit_counter' do
      it 'should increase the hit_counter' do
        previous_counter = url.hit_counter
        url.increase_hit_counter
        expect(url.hit_counter).to match(previous_counter + 1)
      end
    end
  end

  describe 'private instance methods' do
    describe '#shorten_url' do
      it 'should shorten the full_url and save it to short_url with length <= 6' do
        expect(url.short_url.length).to be <= 6
      end
    end

    describe '#pull_title_from_website_later' do
      it 'should pull the title from full_url later' do
        expect {url}.to have_enqueued_job
      end
    end
  end
end
