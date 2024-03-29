using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Brighthouse/Shield_Level_Pay_Plus_Market_Growth.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :brighthouse_simple)
yf = Dict(:Income_Function => :brighthouse_level)
rf = Dict(:Return_Function => :cap_buff)
f = Dict(:Fees => Dict(:rider => 0.015))
s = Dict(:Rollup => prd[:Rollup])
w = Dict(:W => 0.05)

bh_slpp_mg = Dict(:bh_slpp_mg => merge(prd, gf, yf, f, s, w, rf))