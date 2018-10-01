class Lead
  include ActiveModel::Model
  attr_accessor :full_name, :business_name, :email, :telephone
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates_presence_of :full_name, :business_name, :email, :telephone
  validates_format_of :email, with: VALID_EMAIL_REGEX
  validates_format_of :telephone, with: /\d{9,11}/
end