using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Brighthouse/Shield_Level_Pay_Plus_Market.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :brighthouse_account)
yf = Dict(:Income_Function => :brighthouse_level)
rf = Dict(:Return_Function => :cap_buff)
f = Dict(:Fees => Dict(:rider => 0.015))
s = Dict(:Rollup => zeros(length(prd[:Account])))
w = Dict(:W => 0.05)

bh_slpp_m = Dict(:bh_slpp_m => merge(prd, gf, yf, f, s, w, rf))