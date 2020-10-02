defmodule App.CtxTest do
  use App.DataCase

  alias App.Ctx

  describe "tags" do
    alias App.Ctx.Tag

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Ctx.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Ctx.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Ctx.create_tag(@valid_attrs)
      assert tag.text == "some text"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Ctx.update_tag(tag, @update_attrs)
      assert tag.text == "some updated text"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Ctx.update_tag(tag, @invalid_attrs)
      assert tag == Ctx.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Ctx.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Ctx.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Ctx.change_tag(tag)
    end
  end

  describe "status" do
    alias App.Ctx.Status

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_status()

      status
    end

    test "list_status/0 returns all status" do
      status_fixture()
      assert Enum.count(Ctx.list_status()) > 1
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Ctx.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = Ctx.create_status(@valid_attrs)
      assert status.text == "some text"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()

      assert {:ok, %Status{} = status} =
               Ctx.update_status(status, @update_attrs)

      assert status.text == "some updated text"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Ctx.update_status(status, @invalid_attrs)

      assert status == Ctx.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Ctx.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Ctx.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Ctx.change_status(status)
    end
  end
end
