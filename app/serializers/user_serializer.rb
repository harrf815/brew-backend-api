class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :zip
  has_many :feed_backs
end
