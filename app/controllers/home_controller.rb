class HomeController < ApplicationController
  before_action :set_url, only: :visit_shortened_url

  def index
    @url = Url.new
  end

  def most_popular
    @most_popular_urls = Url.most_popular(popular_params[:qty])
  end

  def create_shortened_url
    @url = Url.find_or_initialize_by(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to root_path(@url), notice: 'Url was successfully created.' }
        format.json { render :index, status: :created, location: @url }
        format.js
      else
        format.html { render :index }
        format.json { render json: @url.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def visit_shortened_url; end

  private

  def set_url
    @url = Url.find_and_increase_counter(params[:short_url])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def url_params
    params.require(:url).permit(:full_url)
  end

  def popular_params
    params.permit(:qty)
  end
end
