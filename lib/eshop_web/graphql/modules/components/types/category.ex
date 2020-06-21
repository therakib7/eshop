defmodule EshopWeb.Schema.Types.Category do
  use Absinthe.Schema.Notation

  @desc "A category"
  object :category do
    field :id, :integer
    field :is_active, :boolean
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :parent_id, :integer
    field :attachment_id, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A category update"
  input_object :category_params do
    field :is_active, :boolean
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :parent_id, :integer
    field :attachment_id, :integer
    field :user_id, :integer
  end

  @desc "A item categories"
  input_object :categories do
    field :category_id, :integer
  end
end
