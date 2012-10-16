# Represents a todo and his tags
class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :desc, type: String
  field :done, type: Boolean, default: false

  scope :undone_tasks, where(:done => false)
  scope :done_tasks, where(:done => true)
  scope :by_tag, ->(tag){ where(:desc => /##{Regexp.escape(tag)}/) }
  scope :undone_tagged_with, ->(tag){ undone_tasks.by_tag tag }
  scope :done_tagged_with, ->(tag){ done_tasks.by_tag tag }

  validates :desc, presence: true
end