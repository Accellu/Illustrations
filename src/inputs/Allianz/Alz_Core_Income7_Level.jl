using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/Alz_Core_Income_7_Level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :level)
f = Dict(:Fee => 0.0125)
s = zeros(length(prd[:Income]))
s[1:5] .+= 1.0
s[6:end] .+= 1.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.085)

Alz_Core_Income_7_Level = Dict(:Alz_Core_Income_7_Level => merge(prd, gf, yf, f, s, w))
