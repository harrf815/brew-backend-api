class BrewerySerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :brewery_type, :website_url, :street, :state, :city, :zip, :lat, :long
  has_many :feed_backs
end 