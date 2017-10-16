class Person
  include Mongoid::Document
  include ActiveModel::Serializers::JSON
  store_in collection: 'Person'
  field :name, type: String
  field :last_name, type: String
  field :email_address, type: String
  field :phone_number, type: Array
end
