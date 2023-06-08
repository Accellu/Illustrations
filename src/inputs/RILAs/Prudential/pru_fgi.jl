using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Prudential/FlexGuard_Income_Steprate.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :prudnetial_account)
yf = Dict(:Income_Function => :prudnetial_level)
rf = Dict(:Return_Function => :step_buff)
f = Dict(:Fees => Dict(:rider => 0.015))
s = Dict(:Rollup => zeros(length(prd[:Account])))
w = Dict(:W => 0.065)

pru_fgi = Dict(:pru_fgi => merge(prd, gf, yf, f, s, w, rf))