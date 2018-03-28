class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "posts", database: "forums"

  field :msg, type: String
  field :parent_id, type: String
  field :main_parent_id, type: String

  validates :msg, presence: true

end
