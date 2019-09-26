class GetTitleJob < ApplicationJob
  queue_as :default

  def perform(url_id)
    url = Url.find_by_id(url_id)
    url.pull_title_and_set_status
  end
end
