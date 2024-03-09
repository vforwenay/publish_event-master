class InvitationPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
     @user === @record.create
  end

  def confirm?
  	@user === @record.receiver && @record.event.start_at.to_i >= Time.now.to_i
  end
end