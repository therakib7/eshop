defmodule Eshop.SettingsTest do
  use Eshop.DataCase

  alias Eshop.Settings

  describe "settings" do
    alias Eshop.Settings.Setting

    @valid_attrs %{key: "some key", value: "some value"}
    @update_attrs %{key: "some updated key", value: "some updated value"}
    @invalid_attrs %{key: nil, value: nil}

    def setting_fixture(attrs \\ %{}) do
      {:ok, setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_setting()

      setting
    end

    test "list_settings/0 returns all settings" do
      setting = setting_fixture()
      assert Settings.list_settings() == [setting]
    end

    test "get_setting!/1 returns the setting with given id" do
      setting = setting_fixture()
      assert Settings.get_setting!(setting.id) == setting
    end

    test "create_setting/1 with valid data creates a setting" do
      assert {:ok, %Setting{} = setting} = Settings.create_setting(@valid_attrs)
      assert setting.key == "some key"
      assert setting.value == "some value"
    end

    test "create_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_setting(@invalid_attrs)
    end

    test "update_setting/2 with valid data updates the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{} = setting} = Settings.update_setting(setting, @update_attrs)
      assert setting.key == "some updated key"
      assert setting.value == "some updated value"
    end

    test "update_setting/2 with invalid data returns error changeset" do
      setting = setting_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_setting(setting, @invalid_attrs)
      assert setting == Settings.get_setting!(setting.id)
    end

    test "delete_setting/1 deletes the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{}} = Settings.delete_setting(setting)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_setting!(setting.id) end
    end

    test "change_setting/1 returns a setting changeset" do
      setting = setting_fixture()
      assert %Ecto.Changeset{} = Settings.change_setting(setting)
    end
  end

  describe "user_settings" do
    alias Eshop.Settings.UserSetting

    @valid_attrs %{key: "some key", value: "some value"}
    @update_attrs %{key: "some updated key", value: "some updated value"}
    @invalid_attrs %{key: nil, value: nil}

    def user_setting_fixture(attrs \\ %{}) do
      {:ok, user_setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_user_setting()

      user_setting
    end

    test "list_user_settings/0 returns all user_settings" do
      user_setting = user_setting_fixture()
      assert Settings.list_user_settings() == [user_setting]
    end

    test "get_user_setting!/1 returns the user_setting with given id" do
      user_setting = user_setting_fixture()
      assert Settings.get_user_setting!(user_setting.id) == user_setting
    end

    test "create_user_setting/1 with valid data creates a user_setting" do
      assert {:ok, %UserSetting{} = user_setting} = Settings.create_user_setting(@valid_attrs)
      assert user_setting.key == "some key"
      assert user_setting.value == "some value"
    end

    test "create_user_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_user_setting(@invalid_attrs)
    end

    test "update_user_setting/2 with valid data updates the user_setting" do
      user_setting = user_setting_fixture()
      assert {:ok, %UserSetting{} = user_setting} = Settings.update_user_setting(user_setting, @update_attrs)
      assert user_setting.key == "some updated key"
      assert user_setting.value == "some updated value"
    end

    test "update_user_setting/2 with invalid data returns error changeset" do
      user_setting = user_setting_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_user_setting(user_setting, @invalid_attrs)
      assert user_setting == Settings.get_user_setting!(user_setting.id)
    end

    test "delete_user_setting/1 deletes the user_setting" do
      user_setting = user_setting_fixture()
      assert {:ok, %UserSetting{}} = Settings.delete_user_setting(user_setting)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_user_setting!(user_setting.id) end
    end

    test "change_user_setting/1 returns a user_setting changeset" do
      user_setting = user_setting_fixture()
      assert %Ecto.Changeset{} = Settings.change_user_setting(user_setting)
    end
  end

  describe "company_settings" do
    alias Eshop.Settings.CompanySetting

    @valid_attrs %{key: "some key", type: 42, type_id: 42, value: "some value"}
    @update_attrs %{key: "some updated key", type: 43, type_id: 43, value: "some updated value"}
    @invalid_attrs %{key: nil, type: nil, type_id: nil, value: nil}

    def company_setting_fixture(attrs \\ %{}) do
      {:ok, company_setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_company_setting()

      company_setting
    end

    test "list_company_settings/0 returns all company_settings" do
      company_setting = company_setting_fixture()
      assert Settings.list_company_settings() == [company_setting]
    end

    test "get_company_setting!/1 returns the company_setting with given id" do
      company_setting = company_setting_fixture()
      assert Settings.get_company_setting!(company_setting.id) == company_setting
    end

    test "create_company_setting/1 with valid data creates a company_setting" do
      assert {:ok, %CompanySetting{} = company_setting} = Settings.create_company_setting(@valid_attrs)
      assert company_setting.key == "some key"
      assert company_setting.type == 42
      assert company_setting.type_id == 42
      assert company_setting.value == "some value"
    end

    test "create_company_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_company_setting(@invalid_attrs)
    end

    test "update_company_setting/2 with valid data updates the company_setting" do
      company_setting = company_setting_fixture()
      assert {:ok, %CompanySetting{} = company_setting} = Settings.update_company_setting(company_setting, @update_attrs)
      assert company_setting.key == "some updated key"
      assert company_setting.type == 43
      assert company_setting.type_id == 43
      assert company_setting.value == "some updated value"
    end

    test "update_company_setting/2 with invalid data returns error changeset" do
      company_setting = company_setting_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_company_setting(company_setting, @invalid_attrs)
      assert company_setting == Settings.get_company_setting!(company_setting.id)
    end

    test "delete_company_setting/1 deletes the company_setting" do
      company_setting = company_setting_fixture()
      assert {:ok, %CompanySetting{}} = Settings.delete_company_setting(company_setting)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_company_setting!(company_setting.id) end
    end

    test "change_company_setting/1 returns a company_setting changeset" do
      company_setting = company_setting_fixture()
      assert %Ecto.Changeset{} = Settings.change_company_setting(company_setting)
    end
  end
end
