require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  let(:url) { FactoryBot.create(:url) }
  describe '#generate_badge' do
    context 'a url with status up' do
      it 'should generate a span tag with badge-success' do
        url.status = 'up'
        expect(generate_badge(url).to_param).to eq('<span class="badge badge-pill badge-success">Up</span>')
      end
    end

    context 'a url with status down' do
      it 'should generate a span tag with badge-danger' do
        url.status = 'down'
        expect(generate_badge(url).to_param).to eq('<span class="badge badge-pill badge-danger">Down</span>')
      end
    end

    context 'a url with status unverified' do
      it 'should generate a span tag with badge-info' do
        url.status = 'unverified'
        expect(generate_badge(url).to_param).to eq('<span class="badge badge-pill badge-info">Unverified</span>')
      end
    end
  end
end
