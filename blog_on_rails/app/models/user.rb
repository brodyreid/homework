class User < ApplicationRecord
    has_many :posts, dependent: :nullify
    has_many :comments, dependent: :nullify
    has_secure_password

    validates(
        :email,
        presence: true,
        uniqueness: true,
        format: URI::MailTo::EMAIL_REGEXP,
    )
end
