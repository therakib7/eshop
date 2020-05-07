defmodule EshopWeb.Schema.Queries.UserRole do
    use Absinthe.Schema.Notation

    object :user_role_queries do
        @desc "Get all users roles"
        field :user_roles, list_of(:user_role) do
            resolve &EshopWeb.Schema.Resolvers.UserRole.list_user_roles/3
        end
    end
    
end