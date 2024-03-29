defmodule EshopWeb.Schema.Types.Package do
  use Absinthe.Schema.Notation

  @desc "A package"
  object :package do
    field :id, :integer
    field :title, :string
    field :native_title, :string
    field :subtitle, :string
    field :native_subtitle, :string
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A package update"
  input_object :package_params do
    field :title, :string
    field :native_title, :string
    field :subtitle, :string
    field :native_subtitle, :string
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :integer
  end
end
