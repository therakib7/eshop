defmodule EshopWeb.Schema.Mutations.NotificationMsg do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.NotificationMsg, as: NotificationMsg

  object :notification_msg_mutations do
    @desc "Create a notification_msg"
    field :create_notification_msg, type: :notification_msg do
      arg(:id, :integer)
      arg(:for, :integer)
      arg(:msg, :string)

      resolve(&NotificationMsg.create_notification_msg/3)
    end

    @desc "Update a notification_msg"
    field :update_notification_msg, type: :notification_msg do
      arg(:id, non_null(:id))
      arg(:notification_msg_params, :notification_msg_params)

      resolve(&NotificationMsg.update_notification_msg/2)
    end

    @desc "Delete a notification_msg"
    field :delete_notification_msg, type: :notification_msg do
      arg(:id, non_null(:id))
      resolve(&NotificationMsg.delete_notification_msg/2)
    end
  end
end
