defmodule Eshop.Repo.Migrations.CreatePrivacyPolicies do
  use Ecto.Migration

  def change do
    create table(:privacy_policies) do
      add :content, :text, null: true
      add :native_content, :text, null: true
      add :shop_id, references(:shops, on_delete: :nothing)

      timestamps()
    end

    create index(:privacy_policies, [:shop_id])
  end
end
