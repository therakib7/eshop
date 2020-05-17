defmodule EshopWeb.Schema.Queries.UserProfile do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserProfile, as: UserProfile

  object :user_profile_queries do
    @desc "Get all user_profiles"
    field :user_profiles, list_of(:user_profile) do
      resolve(&UserProfile.list_user_profiles/3)
    end

    @desc "Get a user_profile by its id"
    field :user_profile, :user_profile do
      arg(:id, non_null(:id))
      resolve(&UserProfile.get_user_profile/3)
    end
  end
end
