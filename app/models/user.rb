class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.avatar = auth['info']['image'] || ""
      end
    end
  end

  def owns(record)
    raise 'Incorrect model' unless record.respond_to? :user
    record.user == self
  end
end
