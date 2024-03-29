using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/Alz_222.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :base_multiple)
yf = Dict(:Income_Function => :life_multiple)
rf = Dict(:Return_Function => :cap_floor)
f = Dict(:Fee => 0.0)
s = zeros(length(prd[:Income])) .+ 1.5
s = Dict(:Rollup => s)
w = Dict(:W => 0.05)

Alz_222 = Dict(:Alz_222 => merge(prd, gf, yf, f, s, w, rf))