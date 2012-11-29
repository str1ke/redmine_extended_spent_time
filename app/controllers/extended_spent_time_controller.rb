class ExtendedSpentTimeController < ApplicationController
  unloadable

  def update
    @user = User.current
    time = params[:period].gsub("w","").to_i
    @user.pref[:spent_time_period] = time*7
    @user.pref.save
    
    respond_to do |format|
      format.html { 
        render :partial => "my/blocks/log", :locals => {:user => @user}
      }
    end
  end
end