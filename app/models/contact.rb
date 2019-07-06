class Contact < ApplicationRecord
  validates :label, :content, presence: true
end
