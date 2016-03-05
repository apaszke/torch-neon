package = "neon"
version = "scm-1"

source = {
   url = "git://github.com/apaszke/torch-neon.git",
}

description = {
   summary = "Torch7 FFI bindings for Nervana Neon kernels!",
   homepage = "https://github.com/apaszke/torch-neon",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "cutorch",
   "nn"
}

build = {
   type = "command",
   build_command = [[
git submodule update --init --recursive
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
]],
   install_command = "cd build && $(MAKE) install"
}
