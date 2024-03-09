class InvitationMailer < ApplicationMailer
    default from: 'notification@publis_evnts.com'
    layout 'mailer'

  include EventsHelper
  helper :events
  
  def invite(invitation)
    @event = invitation.event
    @invitation = invitation
    @receiver = invitation.receiver
    @sender = @event.creator

    mail(to: @receiver.email, from: @sender.email, subject: 'Invited on publish event!' )
  end
end
