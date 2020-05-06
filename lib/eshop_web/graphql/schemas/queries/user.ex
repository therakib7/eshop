defmodule EshopWeb.Schema.Queries.Eshop do
    use Absinthe.Schema.Notation

    object :user_queries do
        @desc "Get all users"
        field :users, list_of(:user) do
            resolve &EshopWeb.Schema.Resolvers.Eshop.list_users/3
        end
    end
    
end