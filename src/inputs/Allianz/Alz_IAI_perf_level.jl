using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/alz_iai_perf_level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :account)
yf = Dict(:Income_Function => :level)
rf = Dict(:Return_Function => :cap_buff)
f = Dict(:Fees => Dict(:account => 0.0195))
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0745)
buff = Dict(:Buffer => 0.1)

Alz_IAI_perf_Level = Dict(:Alz_IAI_perf_Level => merge(prd, gf, yf, f, s, w, rf, buff))
