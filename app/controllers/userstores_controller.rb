class UserstoresController < ApplicationController
  def destroy
    @store = Store.find(params[:id])
    userstore = Userstore.where("(user_id = #{current_user.id}) and (store_id = #{@store.id})").take
    if @store.users.count > 1
      userstore.destroy
    else
      @store.destroy
    end
    if !(current_user.stores.present?) && current_user.role == 'vendor'
      current_user.role = 0
      current_user.save
    end
    redirect_to store_path(@store)
  end
end
