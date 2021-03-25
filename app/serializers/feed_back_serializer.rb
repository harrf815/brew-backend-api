class FeedBackSerializer < ActiveModel::Serializer
  attributes :id, :comments, :rating
  has_one :user
  has_one :brewery
end
