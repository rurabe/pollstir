class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :public_url, :title
  
  validates :title, presence: true
  validates :public_url, uniqueness: { case_senstive: false }, :allow_blank => true
  
  before_create :generate_urls


  
  protected
    
    def generate_urls
      self.public_url = generate_public_url if self.public_url.blank?
      self.edit_url = generate_edit_url
    end
    
    def generate_public_url
      public_url = Settings::POLL_NAMES[rand(Settings::POLL_NAMES.length)] + rand(100).to_s
      while !Poll.find_by_public_url(public_url).nil?
        public_url = Settings::POLL_NAMES[rand(Settings::POLL_NAMES.length)] + rand(100).to_s
        puts public_url
      end
      public_url
    end
    
    def generate_edit_url
      SecureRandom.urlsafe_base64(16)
    end
end
