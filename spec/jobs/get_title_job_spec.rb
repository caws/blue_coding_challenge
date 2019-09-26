require 'rails_helper'

RSpec.describe GetTitleJob, type: :job do
  describe '#perform_later' do
    let(:url) { FactoryBot.create(:url) }

    it 'pull the title from the url in the attribute' do
      ActiveJob::Base.queue_adapter = :test
      expect {url}.to have_enqueued_job
    end
  end
end
