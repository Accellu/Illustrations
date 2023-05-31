using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/alz_iai_prottrig_rising.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :life_return)
rf = Dict(:Return_Function => :trig_floor)
f = Dict(:Fee => 0.0195)
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0615)

Alz_IAI_prottrig_Rising = Dict(:Alz_IAI_prottrig_Rising => merge(prd, gf, yf, f, s, w, rf))