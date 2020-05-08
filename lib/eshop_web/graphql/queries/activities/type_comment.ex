defmodule EshopWeb.Schema.Queries.TypeComment do
  use Absinthe.Schema.Notation

  object :type_comment_queries do
    @desc "Get all type_comments"
    field :type_comments, list_of(:type_comment) do
      resolve &EshopWeb.Schema.Resolvers.TypeComment.list_type_comments/3
    end
  end

end
