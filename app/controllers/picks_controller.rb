class PicksController < ApplicationController
  before_action(:force_user_sign_in)
  def index
    matching_picks = Pick.where({ :user_id => @current_user.id })

    @list_of_picks = matching_picks.order({ :created_at => :desc })

    render({ :template => "picks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_picks = Pick.where({ :id => the_id })

    the_pick = matching_picks.at(0)

    render({ :template => "picks/show.html.erb" })
  end

  def create

    the_pick = Pick.new
    the_pick.driver_id = params.fetch("query_driver_id")
    the_pick_driver = the_pick.driver_id
    the_pick.tier = Driver.where({ :id => the_pick_driver }).at(0).tier
  
    the_pick.user_id = @current_user.id


    

    matching_picks = Pick.where({ :user_id => @current_user.id })
    is_allowed = true

    matching_picks.each do |a_pick|
      
     if  a_pick.driver_id == the_pick_driver
        is_allowed = false
     end
    end
    tier_count = 0

    matching_picks.each do |a_pick|
      if a_pick.tier == the_pick.tier
        tier_count += 1
      end
     end
     if the_pick.tier == 1 && tier_count > 2
      is_allowed = false
     end

     if the_pick.tier == 2 && tier_count > 1
      is_allowed = false
     end

      if the_pick.tier == 3 && tier_count > 1
      is_allowed = false
     end
     

    #@list_of_picks = matching_picks.order({ :created_at => :desc })
   # @list_of_firsts = Driver.where({ :tier => 1 })
    ##@list_of_firsts.each do |a_tier|
      
    #@thefirsts = matching_picks.where({ :driver_id => a_tier.id })
    #end
    
    #if the_pick.driver.tier == 1
      
    #  if @thefirsts.count <= 3 && @list_of_picks.where({ :driver_id => the_pick.driver_id }) == nil
   #     the_pick.save
   #   redirect_to("/picks", { :notice => "Pick created successfully." })
    #  else 
    #    redirect_to("/picks", { :notice => "Pick failed to create successfully." })
     # end
   # end
    if is_allowed && the_pick.valid?
      the_pick.save
      redirect_to("/picks", { :notice => "Pick created successfully." })
    else
      redirect_to("/picks", { :notice => "Pick failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_pick = Pick.where({ :id => the_id }).at(0)

    the_pick.driver_id = params.fetch("query_driver_id")
    the_pick.user_id = params.fetch("query_user_id")

    if the_pick.valid?
      the_pick.save
      redirect_to("/picks/#{the_pick.id}", { :notice => "Pick updated successfully."} )
    else
      redirect_to("/picks/#{the_pick.id}", { :alert => "Pick failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_pick = Pick.where({ :id => the_id }).at(0)

    the_pick.destroy

    redirect_to("/picks", { :notice => "Pick deleted successfully."} )
  end
end
