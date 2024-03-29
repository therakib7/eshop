defmodule EshopWeb.Schema.Queries.User do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias EshopWeb.Schema.Resolvers.User

  input_object :user_filter do
    field :id, :integer
    field :first_name, :string
    field :mobile, :string
    field :email, :string
    field :inserted_before, :naive_datetime
    field :inserted_after, :naive_datetime
  end

  connection(node_type: :user)

  object :user_queries do
    @desc "Get all users"
    connection field :users, node_type: :user do
      arg(:filter, :user_filter)
      resolve(&User.relay_list_users/3)
    end

    # @desc "Get all users"
    # field :users, list_of(:user) do
    #   arg(:filter, :user_filter)
    #   arg(:order, type: :sort_order, default_value: :asc)
    #   resolve(&User.list_users/3)
    # end

    @desc "Get a user by its id"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&User.get_user/3)
    end
  end
end
