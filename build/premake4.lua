--  common config for premake4

  -- common
  configurations {"Debug","Release"}
  kind "ConsoleApp"
  -- kind "SharedLib"

  configuration "Debug"
    defines {"DEBUG"}
    flags {"Symbols"}

  configuration "Release"
    defines {"NDEBUG"}
    flags {"Optimize"}

  function do_pkgopt(a)
    buildoptions {"`pkg-config --cflags "..a.."`" }
    linkoptions {"`pkg-config --libs "..a.."`" }
  end

  function def_GLib()
    do_pkgopt("glib-2.0")
    do_pkgopt("gthread-2.0")
    do_pkgopt("gmodule-2.0")
  end

  function def()
    location "."
    targetdir "."
    cfg = configuration()
    local p = project()
    defines {"_XOPEN_SOURCE","_LARGEFILE64_SOURCE"}
    def_GLib()
  end

  function def_c()
    language "C"
    buildoptions { "-std=c99" }
    def()
  end

  function def_cpp()
    language "C++"
    links {"m"}
    buildoptions { "-std=c++0x" }
    def()
  end

  function movelib_and_versionning()
    get_config()
    local cmds = "cp ../lib/output/lib"..p.name..psuffix..shlib_ext.." "..liboutput.."/lib"..p.name..".0"..shlib_ext
    postbuildcommands {
      cmds,
      "lua ../config/SCRIPT/u_libver.lua "..liboutput.." "..p.name
    }
  end

  function def_Test()
    get_config()
    local p = project()
    -- local cmds = "cd ../bin/;./"..p.name..";cd .."
    local cmds = "./"..p.name
    postbuildcommands {cmds}
  end
