using JSON3, JSON, CSV, DataFrames

alz_360_level = copy(JSON3.read(JSON.json(CSV.File("input/Allianz/Alz_360_Level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :alzmult)
yf = Dict(:Income_Function => :levl)
f = Dict(:Fee => 0.013)
s = zeros(length(alz_222[:Income]))
s[1:5] .+= 1.5
s[6:end] .+= 1.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.061)

alz_360_level = Dict(:alz_360_level => merge(alz_360_level, gf, yf, f, s, w))

open("output/alz_360_level.json", "w") do io
    JSON3.pretty(io, alz_360_level)
end
