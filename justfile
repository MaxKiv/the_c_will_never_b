# Build shared library
build:
    scons

# Print all available just commands
help:
    @just --list

run:
    godot --upwards --headless --quit --debug --verbose

editor:
    godot --editor .
