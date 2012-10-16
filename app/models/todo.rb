# Represents a todo and his tags
class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :desc, type: String
  field :done, type: Boolean, default: false

  scope :last, ->(tag){ where(:done => false, :desc => /##{Regexp.escape(tag)}/).limit(20) }
  scope :last_done, ->(tag){ where(:done => true, :desc => /##{Regexp.escape(tag)}/).limit(10) }

  validates :desc, presence: true
end