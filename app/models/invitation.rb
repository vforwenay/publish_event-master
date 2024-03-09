class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id

  before_create :generate_token
  after_create :send_invitation


  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.receiver_id, Time.now, rand].join)
  end

  def send_invitation
    InvitationMailer.invite(self).deliver_later
  end
end
