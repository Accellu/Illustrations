module Illustrations

using CSV, DataFrames, JSON3, JSON

ills = copy.(JSON3.read.(JSON.json.(CSV.File.("input/" .* readdir("input")) .|> DataFrame)))
illnams = replace.(readdir("input"), ".csv" => "")

ills = Dict(illnams .=> ills)

open("output/illustrations.json", "w") do io
    JSON3.pretty(io, ills)
end

end
