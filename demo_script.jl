# This script assumes that you'll run is use 
# julia --project=DIR_WITH_ExamplePkg demo_script.jl

import Pkg
@assert Pkg.project().name == "ExamplePkg"  # Double check that the right Project.toml has been activated

using ExamplePkg                            # Load your package

hello()                                     # Call an exported function
ExamplePkg.goodbye()                        # Call a function that isn't exported

