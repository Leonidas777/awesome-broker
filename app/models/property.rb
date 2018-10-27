class Property < ActiveRecord::Base
  validates :name, presence: true

  scope :published, -> { where(published: true) }
end
