require("C:/dev/premake-vscode/vscode")

workspace "Snake"
    architecture "x64"
    --Build Configurations:
    configurations {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Snake"
    location "Snake"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/Source/**.cpp",
        "%{prj.name}/Source/**.h"
    }

    includedirs
    {
        "vendor/SFML/include"
    }

    libdirs
    {
        "vendor/SFML/lib"
    }

    links
    {
        "opengl32.lib",
        "freetype.lib",
        "winmm.lib",
        "gdi32.lib",
        "flac.lib",
        "vorbisenc.lib",
        "vorbisfile.lib",
        "vorbis.lib",
        "ogg.lib",
        "ws2_32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

        defines
        {
            "SNAKE_PLATFORM_WINDOWS",
            "SFML_STATIC"
        }
    
    filter "configurations:Debug"
        defines "SNAKE_DEBUG"

        runtime "Debug"
        symbols "On"

        links
        {
            "sfml-audio-s-d.lib",
            "sfml-graphics-s-d.lib",
            "sfml-network-s-d.lib",
            "sfml-system-s-d.lib",
            "sfml-window-s-d.lib"
        }

    filter "configurations:Release"
        defines "SNAKE_RELEASE"

        runtime "Release"
        optimize "On"

        links
        {
            "sfml-audio-s.lib",
            "sfml-graphics-s.lib",
            "sfml-network-s.lib",
            "sfml-system-s.lib",
            "sfml-window-s.lib"
        }

    filter "configurations:Dist"
        defines "SNAKE_DIST"

        runtime "Release"
        optimize "On"

        links
        {
            "sfml-audio-s.lib",
            "sfml-graphics-s.lib",
            "sfml-network-s.lib",
            "sfml-system-s.lib",
            "sfml-window-s.lib"
        }
