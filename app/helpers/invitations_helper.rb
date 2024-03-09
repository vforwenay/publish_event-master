module InvitationsHelper
  def option_invite_user
    invited_users = User.where.not(id: current_user.id)
    options = [['All Users', 'All Users']] 
    invited_users.each { |u| options << [ u.email, u.id ] }
    options
  end
end
