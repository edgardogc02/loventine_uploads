class User < ApplicationRecord
  # 0 is an unused state
  enum role_id: { regular: 1, admin: 2 }
end