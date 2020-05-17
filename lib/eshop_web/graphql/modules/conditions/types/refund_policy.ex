defmodule EshopWeb.Schema.Types.RefundPolicy do
  use Absinthe.Schema.Notation

  @desc "A refund_policy"
  object :refund_policy do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A refund_policy update"
  input_object :refund_policy_params do
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer
  end
end
