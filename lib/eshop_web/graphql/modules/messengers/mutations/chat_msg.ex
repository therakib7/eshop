defmodule EshopWeb.Schema.Mutations.ChatMsg do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.ChatMsg, as: ChatMsg
  
	object :chat_msg_mutations do
	  @desc "Create a chat_msg"
	  field :create_chat_msg, type: :chat_msg do 
		  arg :id, :integer
    	arg :deleted_at, :datetime
    	arg :msg, :string
    	arg :msg_type, :integer
    	arg :read, :boolean
    	arg :chat_room_id, :id
    	arg :user_id, :id
    	arg :attachment_id, :id
      
		  resolve &ChatMsg.create_chat_msg/3
	  end
  
	  @desc "Update a chat_msg"
	  field :update_chat_msg, type: :chat_msg do
		  arg(:id, non_null(:id))
		  arg(:chat_msg_params, :chat_msg_params)
  
		  resolve &ChatMsg.update_chat_msg/2
	  end
	  
	  @desc "Delete a chat_msg"
	  field :delete_chat_msg, type: :chat_msg do
		  arg(:id, non_null(:id))
		  resolve &ChatMsg.delete_chat_msg/2
	  end
	end 
end