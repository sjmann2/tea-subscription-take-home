class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :frequency, :status, :customer_id, :price
end
