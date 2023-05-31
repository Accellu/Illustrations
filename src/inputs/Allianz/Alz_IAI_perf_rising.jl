using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/alz_iai_perf_rising.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :Allianz_account)
yf = Dict(:Income_Function => :Allianz_return)
rfg = Dict(:Return_Function => :cap_buff)
rfy = Dict(:Income_Return_Function => :cap_floor)
f = Dict(:Fees => Dict(:account => 0.0195))
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0615)
buff = Dict(:Buffer => 0.1)

Alz_IAI_Perf_Rising = Dict(:Alz_IAI_Perf_Rising => merge(prd, gf, yf, f, s, w, 
    rfg, rfy))