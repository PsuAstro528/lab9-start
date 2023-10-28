using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "input-dir"
            help = "directory with input fits"
            required = true
        "output"
            help = "output filename"
            required = true
    end

    return parse_args(s)
end
args = parse_commandline()
input_dir = args["input-dir"]
output_fn = args["output"]
@assert isdir(input_dir)
@assert !isnothing(match(r".csv$", output_fn))


using FITSIO
using TOML, OrderedCollections
using DataFrames, CSV

files = filter(contains(r"neidL2_.*\.toml"),readdir(input_dir))
sort!(files)

df = DataFrame()

for fn in files
   dict = TOML.parsefile(joinpath(input_dir,fn))
   if size(df,1) == 0
      global df = DataFrame(dict)
   else
      push!(df, dict)
   end
end

CSV.write(output_fn,df)


