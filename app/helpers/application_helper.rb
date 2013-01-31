module ApplicationHelper
  def nguoi_ghi(so, loai)
    a = []
    Xoso.where("so = ? AND loai = ?", so, loai).all.each do |x|
      a << [User.find(x.user_id).username, x.diem]
    end
    return a
  end
  def tong_diem(so, loai)
    x = 0
    Xoso.where("so = ? ANd loai = ?", so, loai).all.map{|i| x = x + i.diem.to_i}
    return x
  end

end
