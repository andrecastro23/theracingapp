Rails.application.routes.draw do



  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Manufacturer resource:

  # CREATE
  post("/insert_manufacturer", { :controller => "manufacturers", :action => "create" })
          
  # READ
  get("/manufacturers", { :controller => "manufacturers", :action => "index" })
  
  get("/manufacturers/:path_id", { :controller => "manufacturers", :action => "show" })
  
  # UPDATE
  
  post("/modify_manufacturer/:path_id", { :controller => "manufacturers", :action => "update" })
  
  # DELETE
  get("/delete_manufacturer/:path_id", { :controller => "manufacturers", :action => "destroy" })

  #------------------------------

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
