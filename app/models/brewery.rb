class Brewery < ApplicationRecord
    has_many :feed_backs
    has_many :users, through: :feed_backs
end
