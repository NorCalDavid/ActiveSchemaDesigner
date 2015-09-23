class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  private

  def logged_in?
    !current_user.nil?
  end

  def current_user_id
    session[:user_id]
  end

  def set_current_user(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def get_table_names(tables)
    table_names = tables.map {|table| table.name} unless tables.nil? || tables == ["No Tables"]
  end

  def select_menu_table_names(table_names)
    if table_names.nil?
      return ["No Tables"]
    else
      option_values = (1..table_names.length).to_a
      table_names.zip(option_values)
    end
  end

  # def current_user
  #   return nil if current_user_id.blank?
  #   begin
  #     @current_user ||= User.find(session[:user_id])
  #   rescue
  #     logout
  #   end
  # end

end
