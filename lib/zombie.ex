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
  defmacro bury() do
    state_filename = state_filename()

    quote bind_quoted: [state_filename: state_filename] do
      binding = binding()

      File.write!(
        state_filename,
        :erlang.term_to_binary(binding)
      )
    end
  end

  @doc """
  Use this to resurrect your saved variables
  """
  defmacro resurrect do
    variable_module()
  end

  def variable_module do
    vars =
      if File.exists?(state_filename()) do
        File.read!(state_filename())
        |> :erlang.binary_to_term()
      else
        []
      end

    defs =
      for {k, v} <- vars do
        v = Macro.escape(v)

        quote do
          def unquote(k)(), do: unquote(v)
        end
      end

    quote do
      defmodule Zombie.Vars do
        unquote(defs)
      end
    end
  end

  defp state_filename do
    Path.relative_to_cwd(@iex_state_filename)
  end
end
