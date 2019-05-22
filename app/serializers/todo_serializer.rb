class TodoSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :title
  attributes :content
  attributes :done_at
  attributes :status # check
  belongs_to :user

  def self.call(todo, options = {})
    new(todo, options).serialized_json
  end
end
