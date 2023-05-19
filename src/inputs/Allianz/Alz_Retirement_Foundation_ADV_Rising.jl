using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/Alz_Retirement_Foundation_ADV_Rising.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :life_return)
rf = Dict(:Return_Function => :cap_floor)
f = Dict(:Fee => 0.0125)
s = zeros(length(prd[:Income]))
s[1:5] .+= 1.0
s[6:end] .+= 1.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.079)

Alz_Retirement_Foundation_ADV_Level = Dict(:Alz_Retirement_Foundation_ADV_Rising => merge(prd, gf, yf, f, s, w, rf))
