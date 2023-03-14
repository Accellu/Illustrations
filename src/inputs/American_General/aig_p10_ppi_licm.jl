using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/American_General/p10_ppi_licm.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :simp)
yf = Dict(:Income_Function => :drop)
f = Dict(:Fee => 0.011)
s = zeros(length(prd[:Income]))
s[1:5] .+= 0.1
s[6:end] .+= 0.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.08)
l = Dict(:L => 0.05)


aig_p10_ppi_licm = Dict(:aig_p10_ppi_licm => merge(prd, gf, yf, f, s, w))
