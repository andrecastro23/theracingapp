class DriversController < ApplicationController
  
  def index
    matching_drivers = Driver.all

    @list_of_drivers = matching_drivers.order({ :created_at => :desc })

    render({ :template => "drivers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_drivers = Driver.where({ :id => the_id })

    @the_driver = matching_drivers.at(0)

    render({ :template => "drivers/show.html.erb" })
  end

  def create
    the_driver = Driver.new
    the_driver.name = params.fetch("query_name")
    the_driver.driver_photo = params.fetch("query_driver_photo")
    the_driver.driver_number = params.fetch("query_driver_number")
    the_driver.tier = params.fetch("query_tier")
    the_driver.team_id = params.fetch("query_team_id")
    the_driver.bio = params.fetch("query_bio")
    the_driver.crew_chief = params.fetch("query_crew_chief")
    the_driver.manufacturer_id = params.fetch("query_manufacturer_id")
    the_driver.number_photo = params.fetch("query_number_photo")

    if the_driver.valid?
      the_driver.save
      redirect_to("/drivers", { :notice => "Driver created successfully." })
    else
      redirect_to("/drivers", { :notice => "Driver failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_driver = Driver.where({ :id => the_id }).at(0)

    the_driver.name = params.fetch("query_name")
    the_driver.driver_photo = params.fetch("query_driver_photo")
    the_driver.driver_number = params.fetch("query_driver_number")
    the_driver.tier = params.fetch("query_tier")
    the_driver.team_id = params.fetch("query_team_id")
    the_driver.bio = params.fetch("query_bio")
    the_driver.crew_chief = params.fetch("query_crew_chief")
    the_driver.manufacturer_id = params.fetch("query_manufacturer_id")
    the_driver.number_photo = params.fetch("query_number_photo")

    if the_driver.valid?
      the_driver.save
      redirect_to("/drivers/#{the_driver.id}", { :notice => "Driver updated successfully."} )
    else
      redirect_to("/drivers/#{the_driver.id}", { :alert => "Driver failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_driver = Driver.where({ :id => the_id }).at(0)

    the_driver.destroy

    redirect_to("/drivers", { :notice => "Driver deleted successfully."} )
  end
end
