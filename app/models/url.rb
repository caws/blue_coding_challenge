class Url < ApplicationRecord
  include HTTParty
  DEFAULT_NUMBER_FOR_MOST_POPULAR = 100

  enum status: %w[unverified up down]

  after_create_commit :create_short_url,
                      :pull_title_from_website_later
  validates_presence_of :full_url
  validates_uniqueness_of :full_url

  validate :valid_url?

  # The scope below returns the most popular URLs in
  # the database. It can receive a qty parameters, thus
  # limiting the number of results in the list.
  # If no parameter is passed, it'll default to the
  # integer value stored in the DEFAULT_NUMBER_FOR_MOST_POPULAR
  # constant.
  scope :most_popular, lambda { |qty = DEFAULT_NUMBER_FOR_MOST_POPULAR|
    order(hit_counter: :desc).limit(qty)
  }

  # Method below searches for a given url
  # using its short url as parameter.
  # It also increases the hit_counter attribute
  # in case it succeeds.
  def self.find_and_increase_counter(short_url)
    url = Url.find_by_short_url(short_url)
    url&.increase_hit_counter

    url
  end

  def increase_hit_counter
    update(hit_counter: hit_counter + 1)
  end

  # Method below tries to pull the title
  # from the url contained in the full_url
  # attribute.
  #
  # If it succeeds, it updates the page_title
  # attribute and the status turns to 'up'.
  #
  # If anything wrong happens, it updates
  # the status to 'down'
  def pull_title_and_set_status
    response = visit_full_url
    if response.success?
      update(page_title: Nokogiri::HTML(response.body).title,
             status: 'up')
    else
      update(status: 'down')
    end
  rescue StandardError
    update(status: 'down')
  end

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

  # Method below is a custom validation
  # that checks if the full_url attribute begins
  # with http or https.
  def valid_url?
    if full_url.present?
      unless full_url[0..6] == 'http://' || full_url[0..7] == 'https://'
        errors.add(:full_url, 'must be preceded by http:// or https://')
      end
    end
  end

  # Method below visits the url and returns
  # an httparty object
  def visit_full_url
    HTTParty.get(full_url, timeout: 10, verify: false)
  end

  # Method below creates a job that invokes
  # the method pull_title_from_url_and_set_status
  def pull_title_from_website_later
    GetTitleJob.perform_later(id)
  end
end
