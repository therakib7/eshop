defmodule EshopWeb.AttachmentController do
  use EshopWeb, :controller

  alias Eshop.Attachments
  alias Eshop.Attachments.Attachment

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    attachments = Attachments.list_attachments()
    render(conn, "index.json", attachments: attachments)
  end

  def create(conn, %{"attachment" => attachment_params}) do
    with {:ok, %Attachment{} = attachment} <- Attachments.create_attachment(attachment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.attachment_path(conn, :show, attachment))
      |> render("show.json", attachment: attachment)
    end
  end

  def show(conn, %{"id" => id}) do
    attachment = Attachments.get_attachment!(id)
    render(conn, "show.json", attachment: attachment)
  end

  def update(conn, %{"id" => id, "attachment" => attachment_params}) do
    attachment = Attachments.get_attachment!(id)

    with {:ok, %Attachment{} = attachment} <- Attachments.update_attachment(attachment, attachment_params) do
      render(conn, "show.json", attachment: attachment)
    end
  end

  def delete(conn, %{"id" => id}) do
    attachment = Attachments.get_attachment!(id)

    with {:ok, %Attachment{}} <- Attachments.delete_attachment(attachment) do
      send_resp(conn, :no_content, "")
    end
  end
end
