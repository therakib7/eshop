defmodule EshopWeb.Schema.Queries.TypeComment do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeComment, as: TypeComment

  object :type_comment_queries do
    @desc "Get all type_comments"
    field :type_comments, list_of(:type_comment) do
      resolve(&TypeComment.list_type_comments/3)
    end

    @desc "Get a type_comment by its id"
    field :type_comment, :type_comment do
      arg(:id, non_null(:id))
      resolve(&TypeComment.get_type_comment/3)
    end
  end
end
