defmodule EshopWeb.Graphql.Middleware.Users do

    def user(action, current_user, res_args, args) do
        case action do
            "user_create" ->  true
            "user_view" -> true
            "user_edit" -> true
            "user_delete" -> true
        end
    end 

end