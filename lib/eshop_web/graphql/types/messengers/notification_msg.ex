defmodule EshopWeb.Schema.Types.NotificationMsg do
  use Absinthe.Schema.Notation
  
  object :notification_msg do
    field :id, :integer
    field :for, :integer
    field :msg, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
