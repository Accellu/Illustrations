using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/Alz_Core_Income_7_Rising.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :life_return)
rf = Dict(:Return_Function => :cap_floor)
f = Dict(:Fee => 0.0125)
s = zeros(length(prd[:Income]))
s[1:5] .+= 1.0
s[6:end] .+= 1.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.085)

Alz_Core_Income_7_Rising = Dict(:Alz_Core_Income_7_Rising => merge(prd, gf, yf, f, s, w, rf))
