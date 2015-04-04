class UserController < ApplicationController


def profile
  @user=User.find(params[:id])
end  

def filter
	
   @search = User.search(params[:q])
   @users = @search.result
   @search.build_condition if @search.conditions.empty?
   @sortsearch.build_sort if not @search.sorts.empty?
   render "filter"

end


def upload
   User.import(params[:file])
   redirect_to showuploads_users_path, notice: "Products imported."
   return
end

def showuploads
    @users=User.recent
    @lastuser=User.order("created_at").last


end	
  def index

  end

  def register
      @user = User.find_by_Email_Address(params[:Email_Address].downcase)
      @user.Password = params[:Password] 
      @user.GCM_RegID = params[:Reg_ID]
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        flash[:success] = "Please confirm your email address to continue"
        redirect_to root_url
      else
        flash[:error] = "Ooooppss, something went wrong!"
        redirect_to root_url
      end
    end

    def signinform

    end

    def signin
      user = User.find_by_Email_Address(params[:Email_Address].downcase)
      if user
          if user.email_confirmed && User.authenticate_user(params[:Email_Address], params[:Password])
            user.save
            render json: user
         else
            render json: nil
          end 
      else
          flash.now[:error] = 'Please activate your account by following the 
          instructions in the account confirmation email you received to proceed'
          render json: nil
      end 
    end

    def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        user.email_activate
        flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
        Please sign in to continue."
        render plain: "OK"
      else
        flash[:error] = "Sorry. User does not exist"
        redirect_to root_url
      end
  end

  def send_profile
    email = params[:Email_Address]
    user = User.find_by_email(params[:Email_Address].downcase)
    render json: user
  end 

  def forgot_password
  user = User.find_by_Email_Address(params[:Email_Address].downcase)
  user.confirm_token = SecureRandom.urlsafe_base64.to_s
  user.save
      if user
          UserMailer.forgot_password(user).deliver
          redirect_to root_url
    else
          flash.now[:error] = 'Email does not exist'
    end   
  end 

  def verify_link
    user = User.find_by_confirm_token(params[:id])
    if user 
      session[:Email_Address] = user.Email_Address
      redirect_to(:controller => "user", :action => 'reset_password_form') 
    else
      render plain: "Incorrect link"
      redirect_to root_url
    end 
  end

  def reset_password_form
  end

  def reset_password
    user = User.find_by_Email_Address(session[:Email_Address])
    user.new_password(params[:Password])
    redirect_to(:action => 'signinform')
  end 





end
