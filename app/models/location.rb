class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "locations", database: "bionexo"

  field :ubs_id, type: String
  field :name, type: String
  field :address, type: String

  validates :msg, presence: true

end