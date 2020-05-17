defmodule EshopWeb.Schema.Mutations.UserLove do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserLove, as: UserLove

  object :user_love_mutations do
    @desc "Create a user_love"
    field :create_user_love, type: :user_love do
      arg(:type, :integer)
      arg(:type_id, :integer)
      arg(:user_id, :id)

      resolve(&UserLove.create_user_love/3)
    end

    @desc "Update a user_love"
    field :update_user_love, type: :user_love do
      arg(:id, non_null(:id))
      arg(:user_love_params, :user_love_params)

      resolve(&UserLove.update_user_love/2)
    end

    @desc "Delete a user_love"
    field :delete_user_love, type: :user_love do
      arg(:id, non_null(:id))
      resolve(&UserLove.delete_user_love/2)
    end
  end
end
