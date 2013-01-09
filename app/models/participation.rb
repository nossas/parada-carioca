class Participation < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  belongs_to :event
  belongs_to :user

  validates :event_id, :user_id, :secret, :presence => true
  validates :secret, :uniqueness => true

  before_validation { self.secret = Digest::MD5.hexdigest(Time.now.to_s + self.user_id.to_s + self.event_id.to_s) if self.secret.nil? }

  def paid?
    moip_status == "4"
  end
end
