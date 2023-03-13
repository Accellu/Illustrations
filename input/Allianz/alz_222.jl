using JSON3, JSON, CSV, DataFrames

alz_222 = copy(JSON3.read(JSON.json(CSV.File("input/Allianz/Alz_222.csv") |> DataFrame)))

gf = Dict(:growth_function => :alzmult)
yf = Dict(:income_function => :alzmult)
f = Dict(:fee => 0.0)
s = zeros(15) .+ 1.5
s[1] = 1.35
s = Dict(:rollup => s)
w = Dict(:w => 0.05)
age = Dict(:age => 60)

alz_222 = Dict(:alz_222 => merge(alz_222, gf, yf, f, s, w, age))

open("output/alz_222.json", "w") do io
    JSON3.pretty(io, alz_222)
end
