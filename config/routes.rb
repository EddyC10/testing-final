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

  #------------------------------

  root "shoes#index"

  get "/shoes/liked_shoes" => "shoes#liked_shoes", as: :liked_shoes
  
  resources :shoes
  # --------------------------------------------------------
  # #CREATE 
  # post "/shoes" => "shoes#create", as: :shoes
  # get "/shoes/new" => "shoes#new", as: :new_shoe

  # #READ
  # get "/shoes" => "shoes#index"
  # get "/shoes/:id" => "shoes#show", as: :shoe

  # #UPDATE
  # patch "/shoes/:id" => "shoes#update"
  # get "/shoes/:id/edit" => "shoes#edit", as: :edit_shoe

  # #DELETE
  # delete "/shoes/:id" => "shoes#destroy"


  # Likes
  get "/user_liked_shoe" => "likes#user_likes"
  get "/user_unliked_shoe/:id" => "likes#user_unliked"

  #Delete 
  get "/delete/:id" => "shoes#destroy"
  get "/delete_comment/:id" => "comments#destroy"

  #Comments 
  get "/comments" => "comments#index"
  get "/edit_comments" => "comments#edit"
  post "/edit_comments/:id" => "comments#update_comment"
  post "/insert_comment" => "comments#create_comment"

  #Liked Shoes
  # get "/liked_shoes" => "shoes#liked_shoes"

end
