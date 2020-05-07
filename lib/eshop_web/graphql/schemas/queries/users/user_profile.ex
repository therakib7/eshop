defmodule EshopWeb.Schema.Queries.UserProfile do
    use Absinthe.Schema.Notation

    object :user_profile_queries do
        @desc "Get all user profiles"
        field :user_profiles, list_of(:user_profile) do
            resolve &EshopWeb.Schema.Resolvers.UserProfile.list_user_profiles/3
        end
    end
end