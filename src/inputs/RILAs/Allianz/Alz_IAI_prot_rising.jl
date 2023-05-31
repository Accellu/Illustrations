using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Allianz/alz_iai_prot_rising.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :allianz_account)
yf = Dict(:Income_Function => :allianz_return)
rfg = Dict(:Return_Function => :cap_floor)
rfy = Dict(:Income_Return_Function => :cap_floor)
f = Dict(:Fees => Dict(:account => 0.0195))
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0615)

Alz_IAI_prot_Rising = Dict(:Alz_IAI_prot_Rising => merge(prd, gf, yf, f, s, w, 
    rfg, rfy))