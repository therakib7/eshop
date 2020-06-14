defmodule EshopWeb.Schema.Types.BankingProvider do
  use Absinthe.Schema.Notation

  @desc "A banking_provider"
  object :banking_provider do
    field :id, :integer
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :type, :integer
    field :attachement_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A banking_provider update"
  input_object :banking_provider_params do
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :type, :integer
    field :attachement_id, :integer
  end
end
