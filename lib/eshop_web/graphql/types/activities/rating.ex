defmodule EshopWeb.Schema.Types.Rating do
  use Absinthe.Schema.Notation

  object "rating" do
    field :comment, :string
    field :star, :integer
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end
end
