defmodule EshopWeb.Schema.Types.TermCondition do
  use Absinthe.Schema.Notation

  @desc "A term_condition"
  object :term_condition do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A term_condition update"
  input_object :term_condition_params do
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer
  end
end
