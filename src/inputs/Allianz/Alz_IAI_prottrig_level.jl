using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/alz_iai_prottrig_level.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :Allianz_account)
yf = Dict(:Income_Function => :Allianz_level)
rfg = Dict(:Return_Function => :trig_floor)
rfy = Dict(:Income_Return_Function => :trig_floor)
f = Dict(:Fees => Dict(:account => 0.0195))
s = zeros(length(prd[:Income]))
s = Dict(:Rollup => s)
w = Dict(:W => 0.0745)

Alz_IAI_prot_Level = Dict(:Alz_IAI_prottrig_Level => merge(prd, gf, yf, f, s, w, 
    rfg, rfy))