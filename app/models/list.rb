class List < ActiveRecord::Base

  belongs_to :user

  has_many :todos, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  validates :user, presence: true

end
