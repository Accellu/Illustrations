using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/alz_iai_guard_rising.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :life_return)
rf = Dict(:Return_Function => :cap_floor)
f = Dict(:Fees => Dict(:account => 0.0195))
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0615)

Alz_IAI_Guard_Rising = Dict(:Alz_IAI_Guard_Rising => merge(prd, gf, yf, f, s, w, rf))
