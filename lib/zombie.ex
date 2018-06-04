defmodule Zombie do
  @moduledoc """
  Bring your variables back from the dead!
  TODO: link to blog post
  """

  @iex_state_filename ".iex_state"

  @doc """
  Use this to save all your variables in the current scope to a file, so that they
  can be reloaded using `Zombify.resurrect`
  """
  def bury(bindings) do
    File.write!(
      state_filename(),
      :erlang.term_to_binary(bindings)
    )
  end

  @doc """
  Use this to resurrect your saved variables
  """
  defmacro resurrect do
    vars =
      File.read!(state_filename())
      |> :erlang.binary_to_term()

    defs =
      for {k, v} <- vars do
        v = Macro.escape(v)

        quote do
          def unquote(k)(), do: unquote(v)
        end
      end

    quote do
      defmodule ZombieState do
        unquote(defs)
      end
    end
  end

  defp state_filename do
    Path.relative_to_cwd(@iex_state_filename)
  end
end
