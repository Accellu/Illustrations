using JSON3, JSON, CSV, DataFrames

alz_222 = copy(JSON3.read(JSON.json(CSV.File("input/Allianz/Alz_222.csv") |> DataFrame)))

gf = Dict(:Growth => :alzmult)
yf = Dict(:Income => :alzmult)
f = Dict(:Fee => 0.0)
s = zeros(15) .+ 1.5
s[1] = 1.35
s = Dict(:Rollup => s)
w = Dict(:W => 0.05)
age = Dict(:Age => 60)

alz_222 = Dict(:alz_222 => merge(alz_222, gf, yf, f, s, w, age))

open("output/alz_222.json", "w") do io
    JSON3.pretty(io, alz_222)
end
