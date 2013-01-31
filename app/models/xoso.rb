class Xoso < ActiveRecord::Base
  attr_accessible :diem, :so, :loai, :thanhtien, :user_id
  belongs_to :users
  NUM_REGEX = /^[0-9]+$/
  validates :so, presence: true, format: {with: NUM_REGEX}, 
          :numericality => { 
            :only_integer => true,
            :greater_than => 0,
            :less_than => 100 
          }
  validates :diem, presence: true, format: {with: NUM_REGEX}, 
          :numericality => {
            only_integer: true,
            greater_than: 0  
          }

  def tinh_tong_tien
    x = 0
    Xoso.find_all_by_user_id(self.id).each do |i|
      x = x + i.thanhtien
    end
    return x
  end    
end
