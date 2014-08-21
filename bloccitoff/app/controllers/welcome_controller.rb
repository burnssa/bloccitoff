class WelcomeController < ApplicationController
  def index
  	if current_user 
  		redirect_to todos_path
  	end
  end
end
