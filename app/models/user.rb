class User
  include Mongoid::Document

  devise :omniauthable,
         :timeoutable, :timeout_in => 1.minutes

  field :doorkeeper_uid, type: String
  field :doorkeeper_access_token, type: String
  field :email, type: String

  def self.find_or_create_for_doorkeeper_oauth(oauth_data)
    User.find_or_initialize_by(doorkeeper_uid: oauth_data.uid).tap do |user|
      user.doorkeeper_uid = oauth_data.uid
      user.email = oauth_data.info.email
    end
  end

  def update_doorkeeper_credentials(oauth_data)
    self.doorkeeper_access_token = oauth_data.credentials.token
    self.email = oauth_data.info.email
  end
end
