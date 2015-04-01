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
   @entry = Entry.find(params[:id])
   @entry.destroy
   redirect_to Micropost.find_by(id: @entry.micropost_id)
  end

  def show
  end
 
  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(entry_params)
      flash[:success] = "Entry updated!"
      redirect_to Micropost.find_by(id: @entry.micropost_id)
    else
      redirect_to Micropost.find_by(id: @entry.micropost_id)
    end
  end

 private

    def entry_params
      params.require(:entry).permit(:option, :micropost_id)
    end

end
