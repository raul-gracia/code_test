class Lead
  include ActiveModel::Model
  attr_accessor :name, :business_name, :email, :telephone_number
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates_presence_of :name, :business_name, :email, :telephone_number
  validates_format_of :email, with: VALID_EMAIL_REGEX
  validates_format_of :telephone_number, with: /\d{11,13}/

  def to_hash
    {
      name: name,
      business_name: business_name,
      email: email,
      telephone_number: telephone_number
    }
  end
end