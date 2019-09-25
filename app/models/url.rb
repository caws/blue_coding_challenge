class Url < ApplicationRecord
  DEFAULT_NUMBER_FOR_MOST_POPULAR = 100

  after_create_commit :create_short_url
  validates_presence_of :full_url
  validates_uniqueness_of :full_url

  scope :most_popular, lambda { |qty = DEFAULT_NUMBER_FOR_MOST_POPULAR|
    order(hit_counter: :desc).limit(qty)
  }

  private

  def create_short_url
    update(short_url: shorten_url)
  end

  # Method below converts a given id
  # to a base36 value.
  #
  # It will generate short urls of lenght
  # <= 5 up until the ID is < 9999999
  def shorten_url
    id.to_s(36)
  end
end
