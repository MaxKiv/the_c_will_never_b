# SConstruct file with compile_commands.json generation for SCons 4+
import os

# Import the environment
env = Environment()

# Enable CompilationDatabase tool
env.Tool("compilation_db")

# Create build directory if it doesn't exist
if not os.path.exists("build"):
    os.makedirs("build")

# Add include directory to include path
env.Append(CPPPATH=["include"])

# Specify build directory
build_dir = "build"

# Change the output directory for all built objects and the shared library
env.VariantDir(build_dir, ".", duplicate=0)

# Define shared library target with source from build directory
shared_lib = env.SharedLibrary(
    target=os.path.join(build_dir, "hello"),
    source=[os.path.join(build_dir, "src/hello.c")],
    SHLIBVERSION="1.0.0",
)

# Install the shared library to the same directory as the SConstruct file
install_dir = "."  # Current directory (same as SConstruct file)
installed_lib = env.Install(install_dir, shared_lib)

# Generate compile_commands.json
compile_db = env.CompilationDatabase("compile_commands.json")

# Make sure the compilation database is always generated
Depends(compile_db, shared_lib)

# Set the default target(s) to include both the library and compile_commands.json
Default([shared_lib, compile_db])

# Alias build targets
Alias("compiledb", compile_db)
Alias("install", install_dir)
