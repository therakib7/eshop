defmodule EshopWeb.Schema.Mutations.TypeComment do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeComment, as: TypeComment

  object :type_comment_mutations do
    @desc "Create a type_comment"
    field :create_type_comment, type: :type_comment do
      arg(:comment, :string)
      arg(:type, :integer)
      arg(:type_id, :integer)
      arg(:user_id, :integer)

      resolve(&TypeComment.create_type_comment/3)
    end

    @desc "Update a type_comment"
    field :update_type_comment, type: :type_comment do
      arg(:id, non_null(:id))
      arg(:type_comment_params, :type_comment_params)

      resolve(&TypeComment.update_type_comment/2)
    end

    @desc "Delete a type_comment"
    field :delete_type_comment, type: :type_comment do
      arg(:id, non_null(:id))
      resolve(&TypeComment.delete_type_comment/2)
    end
  end
end
