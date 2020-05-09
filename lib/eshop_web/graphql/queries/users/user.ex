defmodule EshopWeb.Schema.Queries.User do
    use Absinthe.Schema.Notation

    object :user_queries do
        @desc "Get all users"
        field :users, list_of(:user) do
            resolve &EshopWeb.Schema.Resolvers.User.list_users/3
        end

        @desc "Get a user by its id"
        field :user, :user do
            arg :id, non_null(:id)
            resolve &EshopWeb.Schema.Resolvers.User.get_user/3
        end 
    end
    
end