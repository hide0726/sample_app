class UsersController < ApplicationController
 before_action :signed_in_user, only: [:index, :edit, :update]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy

  def index
   @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @profile = @user.profile
    @sub_email = @user.subemail
  end

  def new
   @user = User.new
  end

  def edit
  end

  def tmp
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

  # def create
  # @user = User.new(user_params) 
  # if @user.save
  #   sign_in @user
  #   flash[:success] = "Welcome to the Sample App!"
  #   redirect_back_or mypage_path
  #  else
  #   render 'new'
  #  end
  # end

 def create
  # 入力したメールアドレスのユーザが存在するか調べる
  tmp_user = User.find_by(email: params[:email])
  if tmp_user.present? && tmp_user.created
    # ユーザ作成済み
    flash.now[:error] = "入力されたメールアドレスは登録済みです。"
    redirect_to signup_path 
  elsif tmp_user.present?
    # ユーザは既にあるが、本登録していない。
    #一度トークンを全て使えなくする
    @myuser = tmp_user
    @myuser.tokens.each do |token|
      # 有効期限を変更する
      token.update_attributes!(expired_at: Time.now)
    end
    # 新しいトークン生成
    @token = SecureRandom.uuid
    # 有効期限は２４時間
    @myuser.tokens.create!(uuid: @token, expired_at: 24.hours.since)
    # メール通知(ActionMailer)
    @mail = RegistMailer.sendmail_regist(@myuser, @token).deliver
    # 仮登録成功ページヘ
    redirect_to :action => 'tmp'
  else
    @user = User.new(user_params)
    if @user.save
      # トークン生成
      @token = SecureRandom.uuid
      @user.tokens.create!(uuid: @token, expired_at: 24.hours.since)
      # メール通知
      @mail = RegistMailer.sendmail_regist(@user, @token).deliver
      redirect_to :action => 'tmp'
    else
      render 'new'
    end
  end
 end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  
 def token
  # 有効期限の確認
  token = Token.find_by_uuid!(params[:uuid])
  # 有効期限を過ぎていないか確認
  if token && token.expired_at > Time.now
    # ２回目アクセスできないように更新
    token.update_attribute(:expired_at, Time.now)
    @user = token.user
    @user.update_attribute(:created, true)
    # 登録完了メール通知
    flash.now[:success] = "本登録が完了しました"
    RegistMailer.sendmail_complete(@user).deliver
    # ログイン画面へ
    redirect_to signin_path
  else
    # トークンがない、もしくは２回目のアクセス -> 失敗を通知
    # ユーザー登録ページのリンクを貼る
    if token && token.user.created
      redirect_to signup_path
      flash.now[:error] = "入力されたメールアドレスは本登録が完了しています。"
    else
      redirect_to signup_path
      flash.now[:error] = "This address is expired."
    end
  end
 end

 private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :created) 
  end


  # Before actions

  def signed_in_user
     unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
  end


  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end


end
