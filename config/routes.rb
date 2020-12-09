Rails.application.routes.draw do



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
