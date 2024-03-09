# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :locations
  has_many :sent_invitations, class_name: 'Invitation', foreign_key: :sender_id
  has_many :received_invitations, class_name: 'Invitation', foreign_key: :receiver_id

  acts_as_voter
end
