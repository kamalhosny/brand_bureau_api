class About < ApplicationRecord
  self.pluralize_table_names = false

  validates :title, :content, presence: true
end
