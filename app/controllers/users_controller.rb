class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if logged_in? && @current_user.admin==1
      @users = User.all
    else
      redirect_to login_path
    end
  end
  # GET /users/1
  # GET /users/1.json
  def show
   @user = current_user
  end

  # GET /users/new
  def new
    if logged_in? 
      log_out
    end
      @user = User.new
  end

  # GET /users/1/edit
  def edit
    @current_user = current_user
    if logged_in? 
    else
      redirect_to login_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.admin != 0 
      @user.admin = 0
    end
    respond_to do |format|
      if @user.save
	log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:user][:admin] != 0
      log_out
      redirect_to login_path
    else
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  #search function is to search the user whose name is the params "search_name"
  #this function is Fuzzy query
  def search
    @users = User.where("name LIKE ?", ['%', params[:search_name], '%'].join)
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :password,:admin, :sex, :institute, :phonenumber, :field, :obligate1, :obligate2, :obligate3)
    end
end
