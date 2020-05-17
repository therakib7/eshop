defmodule EshopWeb.Schema.Mutations.Rating do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Rating, as: Rating

  object :rating_mutations do
    @desc "Create a rating"
    field :create_rating, type: :rating do
      arg(:comment, :string)
      arg(:star, :integer)
      arg(:type, :integer)
      arg(:type_id, :integer)
      arg(:user_id, :id)

      resolve(&Rating.create_rating/3)
    end

    @desc "Update a rating"
    field :update_rating, type: :rating do
      arg(:id, non_null(:id))
      arg(:rating_params, :rating_params)

      resolve(&Rating.update_rating/2)
    end

    @desc "Delete a rating"
    field :delete_rating, type: :rating do
      arg(:id, non_null(:id))
      resolve(&Rating.delete_rating/2)
    end
  end
end
