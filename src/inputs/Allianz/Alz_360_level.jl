using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/Alz_360_Level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account_multiple)
yf = Dict(:Income_Function => :level)
rf = Dict(:Return_Function => :cap_floor)
f = Dict(:Fee => 0.013)
s = zeros(length(prd[:Income]))
s[1:5] .+= 1.5
s[6:end] .+= 1.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.061)

Alz_360_Level = Dict(:Alz_360_Level => merge(prd, gf, yf, f, s, w, rf))
