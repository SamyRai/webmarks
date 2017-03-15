class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ },
                    uniqueness: true
end
