class Contact < ApplicationRecord
  validate :label, :content, presence: true
end
