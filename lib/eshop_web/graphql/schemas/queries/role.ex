defmodule EshopWeb.Schema.Queries.Role do
    use Absinthe.Schema.Notation

    object :role_queries do
        @desc "Get all roles"
        field :roles, list_of(:role) do
            resolve &EshopWeb.Schema.Resolvers.Role.list_roles/3
        end
    end
    
end