class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :username, :auth_token
end
