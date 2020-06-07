defmodule EshopWeb.Graphql.Middleware.Users do
    import Ecto.Query, only: [from: 2]

    def context(args, res_args, user_id) do
        case args.model do
            "user" -> users( res_args, user_id ) 
            # "role" -> roles()
        end
    end  

    defp users( res_args, user_id ) do
        # Eshop.Users.get_user!(res_args.id)
        # shuvo = Eshop.Repo.one(from u in Eshop.Users.User, where: u.id == ^user_id, select: u.id)
        # true  
        if String.to_integer(res_args.id) == user_id, do: true, else: false
         
    end 

    # defp roles() do
    #     case action do
    #         "role_create" ->  true
    #         "role_view" -> true
    #         "role_update" -> true
    #         "role_delete" -> true
    #     end
    # end 

end