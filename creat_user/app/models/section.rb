class Section < ApplicationRecord
    has_many :section_edits
    belongs_to :page
    has_many :admin_users, through: :section_edits

end
