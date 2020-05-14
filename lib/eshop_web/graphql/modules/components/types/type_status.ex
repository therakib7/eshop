defmodule EshopWeb.Schema.Types.TypeStatus do
  use Absinthe.Schema.Notation

  @desc "A type_status"
  object :type_status do
    field :id, :integer
    field :is_active, :boolean
    field :order, :integer
    field :type, :integer
    field :name, :string
    field :native_name, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A type_status update"
  input_object :type_status_params do 
    field :is_active, :boolean
    field :order, :integer
    field :type, :integer
    field :name, :string
    field :native_name, :string
    field :user_id, :id
  end
end