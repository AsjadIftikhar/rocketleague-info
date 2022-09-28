require 'uri'
require 'net/http'
require 'nokogiri'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show_news
    news = []

    uri = URI('https://www.rocketleague.com/ajax/articles-infinite/?lang=en-us&p=24')
    res = Net::HTTP.get_response(uri)
    html = res.body if res.is_a?(Net::HTTPSuccess)
    parsed_data = Nokogiri::HTML.parse(html)

    tags = parsed_data.xpath("//a")
    images = parsed_data.xpath("//img")

    p tags.length
    p images.length

    12.times do |i|
      data = {
        :img => images[i][:src],
        :link => "https://www.rocketleague.com/#{tags[i][:href]}",
        :title => tags[i].text.gsub!(/[^0-9A-Za-z ]/, '')
      }
      news << data
    end

    @news = news
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :notification_on, :email, :password, :display_picture_attributes)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end

end
