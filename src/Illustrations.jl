module Illustrations

using Glob, JSON3

alzprods = reduce(merge, include.(replace.(readdir(glob"*.jl", "src/inputs/RILAs/Allianz"), r"src/" => "")))
bhprods = reduce(merge, include.(replace.(readdir(glob"*.jl", "src/inputs/RILAs/Brighthouse/"), r"src/" => "")))
eqprods = reduce(merge, include.(replace.(readdir(glob"*.jl", "src/inputs/RILAs/Equitable/"), r"src/" => "")))
pruprods = reduce(merge, include.(replace.(readdir(glob"*.jl", "src/inputs/RILAs/Prudential/"), r"src/" => "")))
#aigprods = reduce(merge, include.(replace.(readdir(glob"*.jl", "VAs/src/inputs/American_General"), r"src/" => "")))

open("src/outputs/alzprods.json", "w") do io
    JSON3.pretty(io, alzprods)
end

open("src/outputs/bhprods.json", "w") do io
    JSON3.pretty(io, bhprods)
end

open("src/outputs/eqprods.json", "w") do io
    JSON3.pretty(io, eqprods)
end

open("src/outputs/pruprods.json", "w") do io
    JSON3.pretty(io, pruprods)
end

#open("src/outputs/aigprods.json", "w") do io
#    JSON3.pretty(io, aigprods)
#end

end
