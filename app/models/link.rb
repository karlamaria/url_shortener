class Link < ApplicationRecord
  before_validation :format_url, on: :create
  after_create :shorten_url

  DOMAIN = 'http://url_shortener.herokuapp.com/'.freeze

  def self.find(short_url)
    link_id = ::Base36Encoding.decode(short_url)
    Link.find_by_id(link_id)
  end

  private

  def format_url
    protocol = self.long_url =~ URI::regexp(%w(https http))
    self.long_url = "http://#{self.long_url}" unless protocol
  end

  def shorten_url
    short_url = "#{DOMAIN}#{::Base36Encoding.encode(self.id)}"
    self.update_attributes(short_url: short_url)
  end
end
