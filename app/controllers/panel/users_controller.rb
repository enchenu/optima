class Panel::UsersController < BaseController
  before_action :set_user, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
  	#@users = User.all
    #@users = User.with_full_access
    #@users = User.with_restricted_access
    @users = policy_scope(User)
  end

  def new
  	@user = User.new
    authorize @user
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to panel_users_path, notice: "El Usuario (#{@user.email}) fue creado con exito!"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(params_user)
      #UserMailer.update_email(current_user, @user).deliver_now
      redirect_to panel_users_path, notice: "El Usuario (#{@user.email}) fue actualizado con exito!"
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    user_name = @user.name

    if @user.destroy
      redirect_to panel_users_path #notice: "El Usuario (#{user_email}) fue excluido con exito!"
    else
      render :index
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def params_user
      if password_blank?
        params[:user].except!(:password, :password_confirmation)
      end

      if @admin.blank?
        params.require(:user).permit(:username, :name, :email, :role, :password, :password_confirmation)
      else
        params.require(:user).permit(policy(@user).permitted_attributes)
      end
    end

    def password_blank?
      params[:user][:password].blank? &&
      params[:user][:password_confirmation].blank?
    end
end