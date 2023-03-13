using JSON3, JSON, CSV, DataFrames

alz_222 = copy(JSON3.read(JSON.json(CSV.File("input/Allianz/Alz_222.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :alzmult)
yf = Dict(:Income_Function => :alzmult)
f = Dict(:Fee => 0.0)
s = zeros(length(alz_222[:Income])) .+ 1.5
s[1] = 1.35
s = Dict(:Rollup => s)
w = Dict(:W => 0.05)

alz_222 = Dict(:alz_222 => merge(alz_222, gf, yf, f, s, w))

open("output/alz_222.json", "w") do io
    JSON3.pretty(io, alz_222)
end
