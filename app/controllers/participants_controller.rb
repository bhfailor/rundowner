class ParticipantsController < ApplicationController
  before_filter :authenticate_participant!
  after_action :verify_authorized

  def pundit_user; current_participant; end

  def index
    @participants = Participant.all
    authorize Participant
  end
end
