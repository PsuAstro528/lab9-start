# Astro 528 Lab 9

For this lab, you'll develop a small Julia package and reflect on your progress twoards your goals for the semester.  I suggest that you add you respond to the questions in this README.md file (in your private repository).  

## Exercise 1:  Creating a Module & Package
#### Goals:  
- Create a Julia package
- Organize your code using a module

Instructions for [creating a Julia Package](https://julialang.github.io/Pkg.jl/v1/creating-packages/)

1.  Use `Pkg.generate("ExamplePkg")` to create a new directory with the bare-bone minimal files for your package (ExamplePkg/Project.toml and ExamplePkg/src/ExamplePkg.jl).  Feel fre to pick your own package name.
If you might want to officially register your package, then review the [recommended conventions for package naming](https://julialang.github.io/Pkg.jl/v1/creating-packages/#Package-naming-guidelines-1) before picking your name.
```julia
julia -e 'using Pkg; Pkg.generate("ExamplePkg")' 
```
2. Change into directory `cd ExamplePkg`, copy any other files you'd like to be in your package into the directory from the beginning and use git to add and commit them to your repository.  Those might include:
   - a [LICENSE](https://github.com/PsuAstro528/lab9-start/blob/master/LICENSE) so others know how you'd like your code to be used
   - [.gitignore](https://github.com/PsuAstro528/lab9-start/blob/master/.gitignore) if there are some files that you don't want added to your git repository
```sh
cp PATH/LICENSE .
cp PATH/.gitignore .
```

3.  Make your directory into a git repository.  Add and commit the current files.  Rename your working branch to `main`. 
```sh
git init
git add .
git commit -m "init commit"
git branch -M main
```

4. Go to [GitHub](https://github.com) and click the green "New" button to create a new repository.  
   - Enter a repostiory name that matches your repository name, but ends in ".jl",  e.g., "ExamplePkg.jl".  
   - Add a brief description (optional)
   - Choose whether you'd like your repository to be public or private.  Do _not_ check "Initialize this repository with a README".  Select None for "Add .gitignore" and "Add a license".  
   - Click "Create Repository"
   - Copy the code under "or push an existig repository from the command line"
   - Run that code in the directory you create in step 2.
```sh
git remote add origin git@github.com:eford/ExamplePkg.jl.git
git push -u origin master
```
   - Reload the webpage to make sure your files were successfully pushed to GitHub.

5.  Add some trivial code to your package.  For example, in my [`src/ExamplePkg.jl`](https://github.com/eford/ExamplePkg.jl/blob/master/src/ExamplePkg.jl) I have
```julia
"Package demontrating how to make your code into a Julia pacakge"
module ExamplePkg

using Distributions

export pdf_normal

"""
   pdf_normal(x, mu, sigma)

Return pdf of a normal distribution with mean mu and standard deviation sigma at point x.
"""
function pdf_normal(x::Number, mu::Number, sigma::Number)
  dist = Normal(mu,sigma)
  pdf(dist,x)
end

end # module
```
Note that the package must provide a module of the same name.  You can specify which function and variables you'd like users to be able to access directly after `using` your package, by listing them in `export` commands.  (A function or variables not explicitly exported would need to be accessed like `ExamplePkg.UnexportedFunction()` even after doing `using ExamplePkg.)

Add, commit and push your changes
```sh
git add src/ExamplePkg.jl 
git commit -m "init code"
git push
```

6.  Add any project dependancies to your project's Project.toml and Manifest.toml files.  Note that you don't edit those files manually.  They are updated for you by using `Pkg.add("PackageName")`.  In the example above, I used the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package, so I'd do
```julia
using Pkg
Pkg.activate(".")
Pkg.add("Distributions")
```

7.  Add some tests to your package.
   - Create a test/runtests.jl file
```sh
mkdir -p test && touch test/runtests.jl 
```
   - Edit test/runtests.jl to include tests like we've been practicing.  For a reminder, you can see my example [test/runtests.jl](https://github.com/eford/ExamplePkg.jl/blob/master/test/runtests.jl).  

```julia
using Test
using ExamplePkg
using Distributions

@testset "std_normal" begin
   dist = Normal()
   @test pdf_normal(0.0, 0.0, 1.0) ≈ pdf(dist,0.0)
   @test pdf_normal(2.0, 0.0, 1.0) ≈ pdf(dist,2.0)
   @test pdf_normal(-1.0, 0.0, 1.0) ≈ pdf(dist,-1.0)
end;

@testset "normal" begin
   dist = Normal(1.0,2.0)
   @test pdf_normal(0.0, 1.0, 2.0) ≈ pdf(dist,0.0)
   @test pdf_normal(2.0, 1.0, 2.0) ≈ pdf(dist,2.0)
   @test pdf_normal(-1.0, 1.0, 2.0) ≈ pdf(dist,-1.0)
end;
```
Since your tests will make use of the Test package, add that to the list of dependancies.  Then 
```sh
julia -e 'using Pkg; Pkg.activate("."); Pkg.add("Test")'
```

   - Try running your tests using the package manager.  
```julia
julia -e 'using Pkg; Pkg.actviate("."); Pkg.test("ExamplePkg")'
```
If you encounter any difficulties, then fix them.  Once your initial tests are ready, add/commit/push them.
```
git add Project.toml test
git commit -m "init tests"
git push
```

   - Optionally, add a [.github/workflows/test.yaml](https://github.com/PsuAstro528/lab3-start/blob/main/.github/workflows/test.yaml) file, if you've like GitHub to be able to perform tests and/or enable Continuous Integration testing.  
   
   - Optionally, add a [.github/workflows/ExportPluto.yaml](https://github.com/PsuAstro528/lab3-start/blob/main/.github/workflows/ExportPluto.yaml) file, if you've like GitHub to be able to build html versions of your Pluto notebooks and deploy them via GitHub Pages.  
   
   - Note that, I had to disable GitHub Actions for most repositories in the PsuAstro528 GitHub organization, so that we didn't run out of compute time.  If you create a repository that's not part of the PsuAstro528 organization, then you'll have control of whether/which repositories can automatically trigger workflows via GitHub Actions.


   - Add & commit your changes and push to GitHub.

8.  (Optinal) Add/commmit/push any other files that will help potential users make use of your package more easily.  This isn't important for the lab exercise, but could be important if you wanted to shared your project.  For example,

   - README.md if you'd like to provide users an overview of how to install, use, cite, the code in your project.
   - For more examles of features people like to add to packages, see the [PkgTemplates.jl](https://github.com/invenia/PkgTemplates.jl) package that makes it easier to build packages with a consistent set of features (e.g., code coverage testing, badges, logos, etc.)

9.  Test that others can add your (unregistered package).
   - Exit Julia and change into a new directory.
   - Try installing your package from github
```sh
julia -e 'using Pkg; Pkg.add(PackageSpec(url="https://github.com/eford/ExamplePkg.jl"))'

```
   - Now try loading your package (e.g., `using ExamplePkg`)
   - Run your tests (e.g., `using Pkg; Pkg.test("ExamplePkg")` )
   - Check your docstings (e.g.,  `?ExamplePkg`)

10.  To continue developing your package, tell the package manager that you want to develop (as opposed to use your package).
```julia
using Pkg
Pkg.develop(PackageSpec(url="git@github.com:eford/ExamplePkg.jl.git"))
```
This will cause Julia to download the full git repository for this package into the dev directory (by default `~/.julia/dev/ExamplePkg`, but this is may be overwridden by your JULIA_DEPOT_PATH and/or JULIA_PKG_DEVDIR environment variables).  Now, you can change into that directory to pull, push, commit and use all other features of git.  By commiting and pushing code, you'll be updating the package on github.  When you're 


11. Add a link to the github Repo your new package below.

INSERT URL

12. (Very optional) add other nice features to your project.  For example:
   - If you want code to be run whenever your package in installed (e.g., downloading large datafiles that aren't stored on github), you can put that code in [`deps/build.jl`](https://julialang.github.io/Pkg.jl/v1/creating-packages/#Adding-a-build-step-to-the-package.-1).  
   - If you want to generate webpages of documentation from your docstrings, you could add a [`docs` directory](https://github.com/JuliaLang/Example.jl/tree/master/docs) with the files necessary for [Documenter.jl](https://juliadocs.github.io/Documenter.jl/latest/).
   - If you want to make it easy for people to install everything they need (particularly if your code combines multiple languages), then consider providing a [docker-compose.yml](https://github.com/PsuAstro528/lab5-start-Spring2019/blob/master/docker-compose.yml)


13. (Very optional) Register your package.  If you're interested in sharing your project code with others, then I'd suggest turning it into a Julia package.  Even better, you could _register_ your package into the Julia general registry, so that others can easily install it.  Instructions to request your package be registered are at [Registrator.jl](https://github.com/JuliaRegistries/Registrator.jl)


## Exercise 2:  Reflect on Goals for Semester
#### Goals:  
- Appreciate how much you've learned and what good habits you've developed during the semester.
- Identify goals which you hope to continue working beyond this semester.
- Develop a plan for building skills that you wish to develop.

Review your personal goals for the class (see Lab 1, Ex 3).  
Which goals were you successfull at making progress towards?

INSERT RESPONCE


Are there some goals that you would change or remove, based on what you've learned during the course?

INSERT RESPONCE

Are there some goals that you would like to continue working towards beyond this semester?

INSERT RESPONCE

What can you do, so as to increase the chances that you'll develop those skills/habits while a graduate student?

INSERT RESPONCE

Remember to commit often, push your repository to GitHub and create a pull request as if you wanted to merge your work (presumably in your master branch) into the original branch (which contains the starter code). 

