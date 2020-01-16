class Subject < ApplicationRecord
    has_many :pages




    scope :visible, -> { where(visible: true)}
    scope :invisible, -> { where(visible: false)}
    scope :sorted, -> { order("position ASC")}
    scope :oldest_first, -> { order("created_at ASC")}
    scope :search, -> (query) { where(["position LIKE ?", "%#{query}%"]) }
    scope :search1, lambda { |query| where(["lower(name) LIKE ?", "%#{query.downcase}%"])}

    validates :name, presence: true
                    

   

    validates :position, presence: true,
                         numericality: {greater_than: 0}
    
                    
end
