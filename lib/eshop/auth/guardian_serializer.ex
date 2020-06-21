defmodule Eshop.Guardian do
  use Guardian, otp_app: :eshop
  alias Eshop.Users

  @behaviour Guardian.Serializer

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Users.get_user!(id)
    {:ok, resource}
  end

  def after_encode_and_sign(resource, claims, token) do
    with {:ok, _} <- Guardian.DB.after_encode_and_sign(resource, claims["typ"], claims, token) do
      {:ok, token}
    end
  end

  def on_verify(claims, token) do
    with {:ok, _} <- Guardian.DB.on_verify(claims, token) do
      {:ok, claims}
    end
  end

  def on_revoke(claims, token) do
    with {:ok, _} <- Guardian.DB.on_revoke(claims, token) do
      {:ok, claims}
    end
  end
end
