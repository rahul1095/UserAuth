class ManagesController < ApplicationController
	before_action :set_manage, only: [:show, :edit, :update, :destroy,:show_page]

  # GET /cities
  # GET /cities.json
  def index
    @manages = User.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  def show_page
    render 'manages/show_page'
  end
  def new
    @manage = User.new

  end

  # GET /cities/1/edit
  def edit
  end

  def edit_manage
  render 'manages/edit_manage'
  end 

  # POST /cities
  # POST /cities.json
  def create
 
   @manage =User.new(manage_params)
   @manage.password = 12345678
    respond_to do |format|
      if @manage.save
     Image.create(:image_name=> params[:user][:image_id], :imageable_id=> @manage.id, :imageable_type=> "User")
     #@manage.images.create(:image_name=> params[:user][:image_id])

        format.html { redirect_to root_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @manage }
      else
        format.html { render :new }
        format.json { render json: @manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @manage.update(manage_params)
        format.html { redirect_to manages_path, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage }
      else
        format.html { render :edit }
        format.json { render json: @manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @manage.destroy
    respond_to do |format|
      format.html { redirect_to manages_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage
      @manage = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_params
      params.require(:user).permit(:first_name,:last_name,:role_id, :email, :start_date,:end_date,:monthly_charge,:notes,:image_id,:active,:company_id)
    end
end
