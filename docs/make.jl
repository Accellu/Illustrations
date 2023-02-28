using Illustrations
using Documenter

DocMeta.setdocmeta!(Illustrations, :DocTestSetup, :(using Illustrations); recursive=true)

makedocs(;
    modules=[Illustrations],
    authors="John Stevens",
    repo="https://github.com/j-h-stevens/Illustrations.jl/blob/{commit}{path}#{line}",
    sitename="Illustrations.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://j-h-stevens.github.io/Illustrations.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/j-h-stevens/Illustrations.jl",
    devbranch="main",
)
