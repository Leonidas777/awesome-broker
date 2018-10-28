class Property < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :external_id

  scope :published, -> { where(published: true) }
  scope :from_trovit, -> { where(profider: 'trovit') }
end
