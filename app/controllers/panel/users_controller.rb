class Panel::UsersController < BaseController
  before_action :set_user, only: [:edit, :update, :destroy]
  #after_action :verify_authorized, only: [:new, :destroy]
  #after_action :verify_policy_scoped, only: :index

  def index
  	@users = User.all
    #@users = User.with_restricted_access
    #@users = policy_scope(User)
  end

  def new
  	@user = User.new
    #authorize @user
  end

  def create
  	@user = User.new(user)
    if @user.save
      redirect_to backoffice_users_path, notice: "El Usuario (#{@user.email}) fue creado con exito!"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(params_user)
      UserMailer.update_email(current_user, @user).deliver_now
      redirect_to backoffice_users_path, notice: "El Usuario (#{@user.email}) fue actualizado con exito!"
    else
      render :edit
    end
  end

  def destroy
    #authorize @user
    #user_name = @user.user_name

    if @user.destroy
      redirect_to backoffice_users_path, notice: "El Usuario (#{user_email}) fue excluido con exito!"
    else
      render :index
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    #passwd = params[:user][:password]
    #passwd_confirmation =  params[:user][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
    #  params[:user].except!(:password, :password_confirmation)
    end
    #params.require(:user).permit(policy(@user).permitted_attributes)
  end
end
