class Link < ActiveRecord::Base
  attr_accessible :title, :url, :shortened_link, :counter, :vanity_link
  before_validation :shorten

  validates :title,
    :presence => true
  validates :url,
    :presence => true,
    :format => { :with => /(http:\/\/|https:\/\/).+/}
  validates :shortened_link,
    :presence => true,
    :uniqueness => true

  private

  def shorten
    if self.vanity_link.empty?
      self.shortened_link = link_hash
    else
      self.shortened_link = self.vanity_link
    end
  end

  def link_hash
    (('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..2].join
  end
end
