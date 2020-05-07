defmodule EshopWeb.Schema.Queries.LoginDetail do
    use Absinthe.Schema.Notation

    object :login_detail_queries do
        @desc "Get all roles"
        field :login_details, list_of(:login_detail) do
            resolve &EshopWeb.Schema.Resolvers.Role.list_roles/3
        end
    end
    
end