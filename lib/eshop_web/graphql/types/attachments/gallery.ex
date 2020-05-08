defmodule EshopWeb.Schema.Types.Gallery do
  use Absinthe.Schema.Notation

  object :gallery do
    field :type, :integer
    field :type_id, :integer
    field :attachment_id, :id 
  end

end
