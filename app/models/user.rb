# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  avatar_url  :string(255)
#  provider    :string(255)
#  profile_url :string(255)
#  uid         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  has_many :comments, dependent: :delete_all

  class << self
    def from_omniauth(auth)
      provider = auth.provider
      uid = auth.uid
      info = auth.info.symbolize_keys!
      user = User.find_or_initialize_by(uid: uid, provider: provider)
      user.name = info.name
      user.avatar_url = info.image
      user.profile_url = info.urls.send(provider.capitalize.to_sym)
      user.save!
      user
    end
  end
end
