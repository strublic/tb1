class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "posts", database: "forums"

  field :msg, type: String
  field :parent_id, type: String

end
