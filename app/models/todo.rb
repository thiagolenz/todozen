class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :desc, type: String
end