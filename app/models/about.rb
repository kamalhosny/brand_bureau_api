class About < ApplicationRecord
  self.pluralize_table_names = false

  validate :title, :content, presence: true
end
