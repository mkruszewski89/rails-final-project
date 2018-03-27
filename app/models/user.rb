#Schema:
# name string
# email string
# role = 0 integer
# password string

class User < ApplicationRecord
  has_secure_password

  enum role: [:normal, :admin]
end
