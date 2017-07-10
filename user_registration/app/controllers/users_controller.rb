class UsersController < ApplicationController
  def index
  end

  def register
    if !params.has_key?(:fullname) || params[:fullname].strip.empty?
      render 'users/register'
    elsif
      user = User.new(fullname: params[:fullname], email: params[:email], username: params[:username], password: params[:password], street: params[:street], city: params[:city], state: params[:state], postal: params[:postal], country: params[:country])


      if user.save != nil
        phone1 = Phone.new(phone1: params[:phone1])
        user << phone1
        phone1.save
        session[:username] = user.id
        flash[:notice] = 'Thank you ' + user.fullname + '. You have successfully registered! Email: ' + user.email
      redirect_to '/users/login'
      else
      flash[:notice] = 'Could not save user'
      end
    end
  end
  def login
    if !params[:username] && !params[:password]
        render 'users/login'
    elsif User.find_by_username(params[:username]) != nil && User.find_by_password(params[:password]) != nil
      @user = User.find_by_username(params[:username])
      session[:username] = @user.id
    redirect_to '/users/welcome'
    else
      flash[:notice] = 'Login unsuccessful.  Please try again.'
      render 'users/login'
    end
  end
  def welcome
    @user = User.find_by_id(session[:username])
  end

  def logout
    reset_session
    redirect_to '/users/login'
  end

end
