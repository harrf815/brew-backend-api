class User < ApplicationRecord
    has_many :feed_backs
    has_many :breweries, through: :feed_backs
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
