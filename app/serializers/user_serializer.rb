class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :name, :nickname, :email
  attribute :time_stamp do |obj|
    obj.created_at.to_s
  end

  has_many :todos

  def self.call(user, options = {})
    new(user, options).serialized_json
  end
end
