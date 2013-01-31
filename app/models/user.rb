class User < ActiveRecord::Base
  attr_accessible :email, :username, :tongtien
  has_many :xosos

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false} 
  def tinh_tong_tien
    x = 0
    Xoso.find_all_by_user_id(self.id).each do |i|
      x = x + i.thanhtien
    end
    return x
  end
end
