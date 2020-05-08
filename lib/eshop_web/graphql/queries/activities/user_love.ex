defmodule EshopWeb.Schema.Queries.UserLove do
    use Absinthe.Schema.Notation

    object :user_love_queries do
        @desc "Get all users loves"
        field :user_loves, list_of(:user_love) do
            resolve &EshopWeb.Schema.Resolvers.UserLove.list_user_loves/3
        end
    end
    
end