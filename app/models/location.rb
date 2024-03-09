class Location < ApplicationRecord

  belongs_to :creator, class_name: :User, foreign_key: :user_id
  has_many :comments, as: :commentable
  has_many_attached :images

  validates :name, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :address_line_1, presence: true
  validates_format_of :zipcode,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "should be 12345 or 12345-1234",
                  allow_blank: false
  acts_as_votable


  def full_address
    [country, state, city, zipcode, address_line_1, address_line_2].compact.join(', ')
  end
end
