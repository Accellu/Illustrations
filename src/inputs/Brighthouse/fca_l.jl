using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Brighthouse/Flex_Choice_Access_Drop.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :bh_compound)
yf = Dict(:Income_Function => :bh_drop)
#rf = Dict(:Return_Function => :weighted_returns)
f = Dict(:Fees => merge(Dict(:account => 0.013), Dict(:rider => 0.0135), Dict(:allocation => 0.0051)))
s = Dict(:Rollup => prd[:Rollup])
w = Dict(:W => 0.05)

bh_fcad = Dict(:bh_fcad => merge(prd, gf, yf, f, s, w))