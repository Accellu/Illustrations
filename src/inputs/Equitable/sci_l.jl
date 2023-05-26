using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Equitable/Structured_Capital_Income_Level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :simple_boost)
yf = Dict(:Income_Function => :level)
rf = Dict(:Return_Function => :cap_buff)
f = Dict(:Fees => Dict([:account, :rider] .=> [0.0069, 0.015]))
s = Dict(:Rollup => zeros(length(prd[:Rollup])))
w = Dict(:W => 0.05)

sci_l = Dict(:sci_l => merge(prd, gf, yf, f, s, w, rf))