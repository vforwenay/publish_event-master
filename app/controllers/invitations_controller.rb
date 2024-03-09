# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invitation, only: %i[show edit update]
  before_action :set_event, only: %i[new create]
  before_action :set_params, only: [:create]

  def new
    @invitation = @event.invitations.build
    authorize @event
  end

  def create
    authorize @event
    respond_to do |format|
      if @event.update(permit_params)
        @invitations = @event.invitations
        format.html { redirect_to sent_invitations_invitations_path, notice: 'Invitations was successfully Sent.' }
      else
        format.html { render :new, notice: @location.errors }
      end
    end
  end

  def sent_invitations
    @invitations = current_user.sent_invitations.paginate(page: params[:page], per_page: 5)
  end

  def receive_invitations
    @invitations = current_user.received_invitations.paginate(page: params[:page], per_page: 5)
  end

  def confirm
    @invitation = Invitation.find_by_token(params[:token])
    authorize @invitation

		respond_to do |format|
	    if @invitation && @invitation.update(confirm: true, confirm_at: Time.now)
	      format.html { redirect_to receive_invitations_invitations_path, notice: 'Thanks for confirming!.' }
	    else
	      format.html { redirect_to root_path, notice: 'Unauthrize token.' }
	    end
	  end  
	end

  private

  def set_params
    invite_user_ids = params[:event][:invite_user_ids]
    if invite_user_ids.include?('All Users')
      invite_user_ids = User.where.not(id: current_user.id).ids
    end

    invitations_attributes = invite_user_ids.map { |receiver_id| { receiver_id: receiver_id, sender_id: @event.creator.id } }
    params[:event].merge!(invitations_attributes: invitations_attributes)
    params[:event].delete(:invite_user_ids)
  end

  def permit_params
    params.require(:event).permit(invitations_attributes: %i[receiver_id sender_id])
  end

  def set_event
    @event = current_user.events.find(params[:event_id])
  end

  def set_invitation
    set_event
    @invitation = @event.find(params[:id])
  end
end
