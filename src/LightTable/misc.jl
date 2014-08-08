# Modules

handle("editor.julia.module.update") do editor, data
  mod = data["path"] == nothing ? "Main" : Jewel.filemodule(data["path"])
  mod == "" && (mod = "Main")
  if getthing(mod) == nothing
    notify("This file's module, `$mod`, isn't loaded yet.", class = "error")
    mod = "Main"
  end
  raise(editor, "editor.julia.module.update", mod)
end

# Profile tree display

function displayinline!(req, tree::Jewel.ProfileView.ProfileTree, bounds)
  raise(req, "julia.profile-result",
        {"value" => stringmime("text/html", tree),
         "start" => bounds[1],
         "end"   => bounds[2],
         "lines" => [{:file => li.file,
                      :line => li.line,
                      :percent => p} for (li, p) in Jewel.ProfileView.fetch() |> Jewel.ProfileView.flatlines]})
end

# Add Julia to the path

@unix_only begin
  function addtopath!()
    rmfrompath!()
    path = joinpath(Base.JULIA_HOME, "julia")
    @assert isfile(path)
    run(`ln -s $path /usr/local/bin/julia`)
  end

  function rmfrompath!()
    path = "/usr/local/bin/julia"
    isfile(path) && rm(path)
  end
end