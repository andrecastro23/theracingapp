Rails.application.routes.draw do



  # Routes for the Team resource:

  # CREATE
  post("/insert_team", { :controller => "teams", :action => "create" })
          
  # READ
  get("/teams", { :controller => "teams", :action => "index" })
  
  get("/teams/:path_id", { :controller => "teams", :action => "show" })
  
  # UPDATE
  
  post("/modify_team/:path_id", { :controller => "teams", :action => "update" })
  
  # DELETE
  get("/delete_team/:path_id", { :controller => "teams", :action => "destroy" })

  #------------------------------

  # Routes for the Driver resource:

  # CREATE
  post("/insert_driver", { :controller => "drivers", :action => "create" })
          
  # READ
  get("/drivers", { :controller => "drivers", :action => "index" })
  
  get("/drivers/:path_id", { :controller => "drivers", :action => "show" })
  
  # UPDATE
  
  post("/modify_driver/:path_id", { :controller => "drivers", :action => "update" })
  
  # DELETE
  get("/delete_driver/:path_id", { :controller => "drivers", :action => "destroy" })

  #------------------------------

end
