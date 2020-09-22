class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :api_key
end
