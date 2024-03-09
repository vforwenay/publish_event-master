class Event < ApplicationRecord

  belongs_to :location
  belongs_to :creator, class_name: :User, foreign_key: :user_id
  has_many :comments, as: :commentable
  has_many :invitations
  has_many_attached :images
  accepts_nested_attributes_for :invitations, reject_if: proc { |attributes| attributes['receiver_id'].blank? }

  acts_as_votable
  

  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
