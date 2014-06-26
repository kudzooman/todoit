class Todo < ActiveRecord::Base
  
  belongs_to :list

  validates :item, length: { minimum: 1 }, presence: true
  validates :list, presence: true

  def todo_timer
    days_ago = (Date.today - self.created_at.to_date).to_i
    
    if days_ago <  0
      days_ago = 0
    end

    7 - days_ago
  end
end
