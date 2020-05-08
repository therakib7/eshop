defmodule EshopWeb.Schema.Queries.TypeComment do
  use Absinthe.Schema.Notation

  object :type_comment_queries do
    field :comment, :string
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id 
  end

end
