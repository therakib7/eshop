defmodule EshopWeb.Graphql.Middleware.Users do

    def context(action, current_user, res_args, args) do
        case args.model do
            "user" ->  users(action, current_user, res_args, args) 
            "role" -> roles(action, current_user, res_args, args)
        end
    end 


    defp users(action, current_user, res_args, args) do
        case args.table do
            "user_create" ->  true 
            "user_view" -> true
            "user_update" ->  
            "user_delete" -> true
        end
    end 

    defp roles(action, current_user, res_args, args) do
        case action do
            "role_create" ->  true
            "role_view" -> true
            "role_update" -> true
            "role_delete" -> true
        end
    end 

end