class FeedBackSerializer < ActiveModel::Serializer
  attributes :id, :comments, :rating, :user
  has_one :user
  has_one :brewery
end
