defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  plug Discuss.Plugs.RequireAuth when action in [
    :new,
    :create,
    :edit,
    :update,
    :delete
  ]

  plug :check_topic_owner when action in [:edit, :update, :delete]

  def index(conn, _params) do
    IO.inspect conn.assigns
    render conn, "index.html", topics: Repo.all(Topic)
  end

  def show(conn, %{"id" => topic_id}) do
    render conn, "show.html", topic: Repo.get!(Topic, topic_id)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    changeset = conn.assigns.user
      |> build_assoc(:topics)
      |> Topic.changeset(topic)

    case Repo.insert(changeset) do
      {:ok, _record} ->
        conn
        |> put_flash(:info, "Topic created")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong.")
        |> render("new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      {:ok, _struct} ->
        conn
        |> put_flash(:info, "Topic updated")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong.")
        |> render("edit.html", changeset: changeset, topic: old_topic)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    Repo.get!(Topic, topic_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Topic deleted")
    |> redirect(to: topic_path(conn, :index))
  end

  def check_topic_owner(conn, _params) do
    %{params: %{"id" => topic_id}} = conn

    if Repo.get(Topic, topic_id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You are not allowed to do that!")
      |> redirect(to: topic_path(conn, :index))
      |> halt()
    end
  end
end
