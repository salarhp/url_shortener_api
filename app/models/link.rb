class Link < ApplicationRecord
  belongs_to :user

  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, on: :create

  enum :status, { active: 0, inactive: 1, archived: 2 }

  private

  def generate_slug
    self.slug ||= SecureRandom.urlsafe_base64(4)
  end
end
