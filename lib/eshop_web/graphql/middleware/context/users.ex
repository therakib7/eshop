defmodule EshopWeb.Graphql.Middleware.Users do

    def user(action, current_user, res_args, args) do
        case action do
            "user_create" ->  true 
            "user_view" -> true
            "user_update" ->  
            "user_delete" -> true
        end
    end 

    def role(action, current_user, res_args, args) do
        case action do
            "role_create" ->  true
            "role_view" -> true
            "role_update" -> true
            "role_delete" -> true
        end
    end 

end