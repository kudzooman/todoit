class Todo < ActiveRecord::Base
  belongs_to :list

validates :item, length: { minimum: 1 }, presence: true
validates :list, presence: true
validates :user, presence: true

end
