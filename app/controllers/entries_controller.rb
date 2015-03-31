class EntriesController < ApplicationController
  before_action :signed_in_user

  def create
   @entry = current_user.entries.build(entry_params)
   if @entry.save
      flash[:success] = "Entry created!"
      redirect_to Micropost.find_by(id: @entry.micropost_id)
   else
     redirect_to Micropost.find_by(id: @entry.micropost_id)
   end 
  end

  def destroy
  end

 private

    def entry_params
      params.require(:entry).permit(:option, :micropost_id)
    end

end
