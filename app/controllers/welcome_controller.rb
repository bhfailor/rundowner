class WelcomeController < ApplicationController
  before_action :authenticate_participant!, :except => :index

  def pundit_user; current_participant; end

  def index
  end
end
