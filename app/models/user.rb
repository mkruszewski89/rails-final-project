#Schema:
# name string
# email string
# role integer
# password string

class User < ApplicationRecord
  has_secure_password

  enum role: [:normal, :admin]
end
