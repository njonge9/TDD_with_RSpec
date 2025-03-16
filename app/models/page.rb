class Page < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true

  before_validation :make_slug

  private

  def make_slug
    return if title.blank?

    self.slug = title
                .downcase
                .gsub(/[_ ]/, "-")      # Replace spaces and underscores with single dashes
                .gsub(/[^a-z0-9-]/, "")  # Remove all special characters except dashes
                .gsub(/-{2,}/, "-")      # Replace multiple dashes with a single dash
                .gsub(/^-+|-+$/, "")     # Remove leading and trailing dashes
  end
end
