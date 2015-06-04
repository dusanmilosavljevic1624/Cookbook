class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  has_many :reviews

  before_save {self.email = email.downcase}
  validates :chefname, presence: true, length: {minimum: 5, maximum: 20},
                      format: {with: /\A[a-zA-Z0-9]+\z/}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
                    uniqueness: {case_sensitive: false},
                    format: {with: VALID_EMAIL_REGEX}
  validates :password, length: {minimum: 6}, allow_blank: true
  has_secure_password


end