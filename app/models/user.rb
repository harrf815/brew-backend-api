class User < ApplicationRecord
    has_many :feed_backs
    has_many :breweries, through: :feed_backs
end
