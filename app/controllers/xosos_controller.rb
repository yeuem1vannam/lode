class XososController < ApplicationController
  # GET /xosos
  # GET /xosos.json
  def index
    @xosos = Xoso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @xosos }
    end
  end

  # GET /xosos/1
  # GET /xosos/1.json
  def show
    @xoso = Xoso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xoso }
    end
  end

  # GET /xosos/new
  # GET /xosos/new.json
  def new
    @xoso = Xoso.new
    binding.pry
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xoso }
    end
  end

  # GET /xosos/1/edit
  def edit
    @xoso = Xoso.find(params[:id])
  end

  # POST /xosos
  # POST /xosos.json
  def create
    params[:xoso][:thanhtien] = params[:xoso][:loai] == 'Lo' ? params[:xoso][:diem].to_i * 23000 : params[:xoso][:diem].to_i * 1000 
    if Xoso.where("loai = ? AND user_id = ?", params[:xoso][:loai], params[:xoso][:user_id].to_i).all.map{|i| i.so}.include?(params[:xoso][:so].to_i)
      x = Xoso.where("so = ? AND loai = ? AND user_id = ?", params[:xoso][:so].to_i, params[:xoso][:loai], params[:xoso][:user_id].to_i).first
      x.diem = x.diem + params[:xoso][:diem].to_i
      x.thanhtien = x.thanhtien + params[:xoso][:thanhtien]
      stage = x.save
    else
      @xoso = Xoso.new(params[:xoso])
      stage = @xoso.save
    end
    @user = User.find(params[:xoso][:user_id])
    @lode = @user.xosos.order(:loai)

    respond_to do |format|
      if stage
        @user.tongtien = @user.tinh_tong_tien
        @user.save
        format.html {
          redirect_to user_path @user
          flash[:notice] = 'Ghi xong con ' + "#{params[:xoso][:loai]}" + ' so ' + "#{params[:xoso][:so]}" + ' voi ' + "#{params[:xoso][:diem]}" + ' diem.'
        }
        format.json { render json: @xoso, status: :created, location: @xoso }
      else
        format.html { 
          redirect_to user_path @user
          flash[:notice] = @xoso.errors.full_messages.to_sentence
        }
        format.json { render json: @xoso.errors, status: :unprocessable_entity  }
        format.js
      end
    end
  end

  # PUT /xosos/1
  # PUT /xosos/1.json
  def update
    @xoso = Xoso.find(params[:id])

    respond_to do |format|
      if @xoso.update_attributes(params[:xoso])
        format.html { redirect_to @xoso, notice: 'Xoso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xoso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xosos/1
  # DELETE /xosos/1.json
  def destroy
    @xoso = Xoso.find(params[:id])
    @user = User.find(params[:user_id])
    @xoso.destroy
    @user.tongtien = @user.tinh_tong_tien
    @user.save
    respond_to do |format|
      format.html { redirect_to user_path @user }
      format.json { head :no_content }
    end
  end
end
