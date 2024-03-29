using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Equitable/Structured_Capital_Income_Accelerated_Dual_Direction.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :equitable_simple)
yf = Dict(:Income_Function => :equitable_drop)
rf = Dict(:Return_Function => :abs_buff)
f = Dict(:Fees => Dict([:account, :rider] .=> [0.0069, 0.015]))
s = Dict(:Rollup => prd[:Rollup])
w = Dict(:W => 0.05)
inc = Dict(:inc => 0.001)

sci_dual_a = Dict(:sci_dual_a => merge(prd, gf, yf, f, s, w, rf, inc))