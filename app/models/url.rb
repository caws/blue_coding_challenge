class Url < ApplicationRecord
  DEFAULT_NUMBER_FOR_MOST_POPULAR = 100

  after_create_commit :create_short_url
  validates_presence_of :full_url
  validates_uniqueness_of :full_url

  # The scope below returns the most popular URLs in
  # the database. It can receive a qty parameters, thus
  # limiting the number of results in the list.
  # If no parameter is passed, it'll default to the
  # integer value stored in the DEFAULT_NUMBER_FOR_MOST_POPULAR
  # constant.
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
