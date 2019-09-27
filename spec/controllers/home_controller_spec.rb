require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #visit_shortened_url" do
    it "should enter redirection page" do
      get :visit_shortened_url, params: {short_url: Url.first.short_url}
      expect(assigns(:url)).to eq(Url.first)
    end
  end

  describe "GET #most_popular" do
    it "returns http success" do
      get :most_popular
      expect(response).to have_http_status(:success)
    end

    it "assigns @most_popular_urls" do
      get :most_popular, params: {qty: 100}
      most_popular_urls = Url.most_popular
      expect(assigns(:most_popular_urls)).to eq(most_popular_urls)
    end
  end

  describe "POST #create_shortened_url" do
    context 'with valid input' do
      it "should create a valid url record" do
        post :create_shortened_url, params: {url: {full_url: 'https://test.com'}}
        expect(assigns(:url).valid?).to be(true)
      end
    end

    context 'with invalid input' do
      it "should not create a valid url record" do
        post :create_shortened_url, params: {url: {full_url: 'test.com'}}
        expect(assigns(:url).valid?).to be(false)
      end
    end
  end


end
