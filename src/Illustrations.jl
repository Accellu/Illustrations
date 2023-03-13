module Illustrations

using Glob, JSON3

alzprods = include.(replace.(readdir(glob"*.jl", "src/inputs/Allianz"), r"src/" => ""))

open("src/outputs/alzprods.json", "w") do io
    JSON3.pretty(io, alzprods)
end

end
