class Property < ActiveRecord::Base
  validates :name, presence: true

  scope :published, -> { where(published: true) }
  scope :from_trovit, -> { where(profider: 'trovit') }
end
