defmodule EshopWeb.Schema.Queries.UserLove do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserLove, as: UserLove

  object :user_love_queries do
    @desc "Get all user_loves"
    field :user_loves, list_of(:user_love) do
      resolve(&UserLove.list_user_loves/3)
    end

    @desc "Get a user_love by its id"
    field :user_love, :user_love do
      arg(:id, non_null(:id))
      resolve(&UserLove.get_user_love/3)
    end
  end
end
