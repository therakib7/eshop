defmodule EshopWeb.Schema.Types.ItemCategory do
  use Absinthe.Schema.Notation

  @desc "A item_category"
  object :item_category do
    field :id, :integer
    field :item_id, :integer
    field :category_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A item_category update"
  input_object :item_category_params do
    field :item_id, :integer
    field :category_id, :integer
  end
end
