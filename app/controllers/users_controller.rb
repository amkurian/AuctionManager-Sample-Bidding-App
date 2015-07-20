class UsersController < ApplicationController
   # load_and_authorize_resource
  # def index
  # 	@users = User.all
  #   @designations=Designation.all.map{|d| [d.designation_name, d.id]}
  # end

  # def new
  # 	@user = User.new
  #   @designations=Designation.all.map{|d| [d.designation_name, d.id]}
  # end
  # def create
	 #  @user = User.new(user_params)
 	#   if @user.save
  #   	redirect_to @user
  # 	else
  #     @designations=Designation.all.map{|d| [d.designation_name, d.id]}

  #  		render 'new'

  # 	end
  # end
  def show
  	@user = User.find(params[:id])
    @total_experience = @user.previous_experience + ((Date.today-@user.date_of_joining)/365).round(2)
  end
  def edit
    @user = User.find(params[:id])
    @designations=Designation.pluck(:designation_name, :id)
     end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to users_path
  # end

  private
 	def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :login_id,  :employee_id, :date_of_birth, :gender, :time_zone, :designation_id, :date_of_joining, :education, :comments, :previous_experience, :work_phone)
 	end
end
