class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  
    def slug
      username.strip.downcase.gsub /\W+/, '-'  
    end
    
    def self.find_by_slug(slug)
       self.all.find{|a| a.slug == slug}
    end

end