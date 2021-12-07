class Article < ApplicationRecord
  REGEX_FOR_SLUG = /[a-zA-Z0-9-]{3,20}/.freeze
  validates :title, presence: true, length: { in: 3..20 }
  validates :content, presence: true, length: { in: 5..100 }
  validates :slug, presence: true,
                   uniqueness: true, length: { in: 3..20 }, format: { with: REGEX_FOR_SLUG }

  scope :latest_order, -> { order(created_at: :desc) }
end
