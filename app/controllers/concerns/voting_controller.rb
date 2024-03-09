# frozen_string_literal: true

module VotingController
  extend ActiveSupport::Concern

  included do
    before_action :obtain_resources, only: %i[like unlike]
  end

  def like
    @object.upvote_from current_user
    render layout: false, partial: 'shared/like_unlike.js.haml'
  end

  def unlike
    @object.downvote_from current_user
    render layout: false, partial: 'shared/like_unlike.js.haml'
  end

  private

  def obtain_resources
    # here we retrieve the name of a particular controller which triggered this action
    model = controller_name.singularize.camelize.constantize
    @object = model.find(params[:id])
  end
end
