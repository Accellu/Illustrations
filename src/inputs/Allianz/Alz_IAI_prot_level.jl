using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/alz_iai_prot_level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :level)
rf = Dict(:Income_Function => :cap_floor)
f = Dict(:Fee => 0.0195)
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0745)

Alz_IAI_prot_Level = Dict(:Alz_IAI_prot_Level => merge(prd, gf, yf, f, s, w, rf))