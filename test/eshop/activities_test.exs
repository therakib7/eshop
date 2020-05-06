defmodule Eshop.ActivitiesTest do
  use Eshop.DataCase

  alias Eshop.Activities

  describe "user_loves" do
    alias Eshop.Activities.UserLove

    @valid_attrs %{type: 42, type_id: 42}
    @update_attrs %{type: 43, type_id: 43}
    @invalid_attrs %{type: nil, type_id: nil}

    def user_love_fixture(attrs \\ %{}) do
      {:ok, user_love} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Activities.create_user_love()

      user_love
    end

    test "list_user_loves/0 returns all user_loves" do
      user_love = user_love_fixture()
      assert Activities.list_user_loves() == [user_love]
    end

    test "get_user_love!/1 returns the user_love with given id" do
      user_love = user_love_fixture()
      assert Activities.get_user_love!(user_love.id) == user_love
    end

    test "create_user_love/1 with valid data creates a user_love" do
      assert {:ok, %UserLove{} = user_love} = Activities.create_user_love(@valid_attrs)
      assert user_love.type == 42
      assert user_love.type_id == 42
    end

    test "create_user_love/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_user_love(@invalid_attrs)
    end

    test "update_user_love/2 with valid data updates the user_love" do
      user_love = user_love_fixture()
      assert {:ok, %UserLove{} = user_love} = Activities.update_user_love(user_love, @update_attrs)
      assert user_love.type == 43
      assert user_love.type_id == 43
    end

    test "update_user_love/2 with invalid data returns error changeset" do
      user_love = user_love_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_user_love(user_love, @invalid_attrs)
      assert user_love == Activities.get_user_love!(user_love.id)
    end

    test "delete_user_love/1 deletes the user_love" do
      user_love = user_love_fixture()
      assert {:ok, %UserLove{}} = Activities.delete_user_love(user_love)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_user_love!(user_love.id) end
    end

    test "change_user_love/1 returns a user_love changeset" do
      user_love = user_love_fixture()
      assert %Ecto.Changeset{} = Activities.change_user_love(user_love)
    end
  end

  describe "ratings" do
    alias Eshop.Activities.Rating

    @valid_attrs %{comment: "some comment", star: 42, type: 42, type_id: 42}
    @update_attrs %{comment: "some updated comment", star: 43, type: 43, type_id: 43}
    @invalid_attrs %{comment: nil, star: nil, type: nil, type_id: nil}

    def rating_fixture(attrs \\ %{}) do
      {:ok, rating} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Activities.create_rating()

      rating
    end

    test "list_ratings/0 returns all ratings" do
      rating = rating_fixture()
      assert Activities.list_ratings() == [rating]
    end

    test "get_rating!/1 returns the rating with given id" do
      rating = rating_fixture()
      assert Activities.get_rating!(rating.id) == rating
    end

    test "create_rating/1 with valid data creates a rating" do
      assert {:ok, %Rating{} = rating} = Activities.create_rating(@valid_attrs)
      assert rating.comment == "some comment"
      assert rating.star == 42
      assert rating.type == 42
      assert rating.type_id == 42
    end

    test "create_rating/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_rating(@invalid_attrs)
    end

    test "update_rating/2 with valid data updates the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{} = rating} = Activities.update_rating(rating, @update_attrs)
      assert rating.comment == "some updated comment"
      assert rating.star == 43
      assert rating.type == 43
      assert rating.type_id == 43
    end

    test "update_rating/2 with invalid data returns error changeset" do
      rating = rating_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_rating(rating, @invalid_attrs)
      assert rating == Activities.get_rating!(rating.id)
    end

    test "delete_rating/1 deletes the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{}} = Activities.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_rating!(rating.id) end
    end

    test "change_rating/1 returns a rating changeset" do
      rating = rating_fixture()
      assert %Ecto.Changeset{} = Activities.change_rating(rating)
    end
  end

  describe "type_comments" do
    alias Eshop.Activities.TypeComment

    @valid_attrs %{comment: "some comment", type: 42, type_id: 42}
    @update_attrs %{comment: "some updated comment", type: 43, type_id: 43}
    @invalid_attrs %{comment: nil, type: nil, type_id: nil}

    def type_comment_fixture(attrs \\ %{}) do
      {:ok, type_comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Activities.create_type_comment()

      type_comment
    end

    test "list_type_comments/0 returns all type_comments" do
      type_comment = type_comment_fixture()
      assert Activities.list_type_comments() == [type_comment]
    end

    test "get_type_comment!/1 returns the type_comment with given id" do
      type_comment = type_comment_fixture()
      assert Activities.get_type_comment!(type_comment.id) == type_comment
    end

    test "create_type_comment/1 with valid data creates a type_comment" do
      assert {:ok, %TypeComment{} = type_comment} = Activities.create_type_comment(@valid_attrs)
      assert type_comment.comment == "some comment"
      assert type_comment.type == 42
      assert type_comment.type_id == 42
    end

    test "create_type_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_type_comment(@invalid_attrs)
    end

    test "update_type_comment/2 with valid data updates the type_comment" do
      type_comment = type_comment_fixture()
      assert {:ok, %TypeComment{} = type_comment} = Activities.update_type_comment(type_comment, @update_attrs)
      assert type_comment.comment == "some updated comment"
      assert type_comment.type == 43
      assert type_comment.type_id == 43
    end

    test "update_type_comment/2 with invalid data returns error changeset" do
      type_comment = type_comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_type_comment(type_comment, @invalid_attrs)
      assert type_comment == Activities.get_type_comment!(type_comment.id)
    end

    test "delete_type_comment/1 deletes the type_comment" do
      type_comment = type_comment_fixture()
      assert {:ok, %TypeComment{}} = Activities.delete_type_comment(type_comment)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_type_comment!(type_comment.id) end
    end

    test "change_type_comment/1 returns a type_comment changeset" do
      type_comment = type_comment_fixture()
      assert %Ecto.Changeset{} = Activities.change_type_comment(type_comment)
    end
  end
end
