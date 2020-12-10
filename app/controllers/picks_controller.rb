class PicksController < ApplicationController
  def index
    matching_picks = Pick.where({ :user_id => @current_user.id })

    @list_of_picks = matching_picks.order({ :created_at => :desc })

    render({ :template => "picks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_picks = Pick.where({ :id => the_id })

    @the_pick = matching_picks.at(0)

    render({ :template => "picks/show.html.erb" })
  end

  def create
    the_pick = Pick.new
    the_pick.driver_id = params.fetch("query_driver_id")
    the_pick.user_id = @current_user.id

    if the_pick.valid?
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
