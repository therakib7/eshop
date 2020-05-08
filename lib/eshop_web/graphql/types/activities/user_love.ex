defmodule EshopWeb.Schema.Types.UserLove do
  use Absinthe.Schema.Notation

  object :user_love do 
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id 
  end 
end
