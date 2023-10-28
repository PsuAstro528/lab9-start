using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "input"
            help = "input NEID L2 fits file"
            required = true
        "output"
            help = "output"
            required = true
        "--opt1"
            arg_type = Float64         # only Float64 arguments allowed
            default = 0.0              # this is used when the option is not passed
            help = "an optional parameter"
    end

    return parse_args(s)
end
args = parse_commandline()
input_fn = args["input"]
output_fn = args["output"]
@assert !isnothing(match(r".fits$",input_fn))
output_csv = !isnothing(match(r".csv$", output_fn))
output_toml = !isnothing(match(r".toml$", output_fn))
@assert output_csv || output_toml

using FITSIO

f = FITS(input_fn)
hdr = read_header(f[1])
hdr_keys_to_keep = keys(hdr)[14:28]

if output_csv
   using DataFrames, CSV
   df = DataFrame(map(k->Symbol(k)=>hdr[k], hdr_keys_to_keep))
   CSV.write(output_fn,df)
end

if output_toml
   using TOML, OrderedCollections
   dict = OrderedDict(map(k->Symbol(k)=>hdr[k], hdr_keys_to_keep))
   open(output_fn, "w") do io
      TOML.print(io, dict)
   end
end


