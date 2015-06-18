class Participant < ActiveRecord::Base
  enum role: [:client, :trainer, :dev]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end
  
  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :confirmable, :validatable
end
