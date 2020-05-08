defmodule EshopWeb.Schema.Types.TypeComment do
  use Absinthe.Schema.Notation

  object :type_comment do
    field :comment, :string
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id 
  end

end
