class ParticipantPolicy
  attr_reader :current_user, :model

  def initialize(whatever, model)
    @current_user = whatever
    @user = model
  end

  def index?
    #require 'pry'
    #binding.pry
    @current_user.trainer?
  end
  
end
