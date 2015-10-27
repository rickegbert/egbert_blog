class Admin < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true

  before_create { generate_token(:auth_token) }

  protected

  # 在每次生成admin时添加auth_token
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Admin.exists?(column => self[column])
  end
end
