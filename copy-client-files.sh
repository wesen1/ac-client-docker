#!/bin/bash

downloadUrl="https://github.com/assaultcube/AC/releases/download/v1.2.0.2/AssaultCube_v1.2.0.2.tar.bz2"
archiveFilePath="./AssaultCube_v1.2.0.2.tar.bz2"
archiveMainDirectoryName="AssaultCube_v1.2.0.2"
outputDirectory="/ac-client"


# Install the packages that are needed to download and extract the AssaultCube client files
apt-get install -y wget
apt-get install -y bzip2

# Download the current AssaultCube 1.2.0.2 release
wget "$downloadUrl"

# Extract the AssaultCube client files
filesToExtract=(
    # These files are the ones that are required inside the container
    "$archiveMainDirectoryName/bin_unix/linux_64_client"
    "$archiveMainDirectoryName/assaultcube.sh"

    # Extract the default config files, may be overwritten by a volume
    "$archiveMainDirectoryName/config/admin.cfg"
    "$archiveMainDirectoryName/config/autoexec.cfg"
    "$archiveMainDirectoryName/config/autosave.cfg"
    "$archiveMainDirectoryName/config/compatibility.cfg"
    "$archiveMainDirectoryName/config/default_map_settings.cfg"
    "$archiveMainDirectoryName/config/defaults.cfg"
    "$archiveMainDirectoryName/config/docs.cfg"
    "$archiveMainDirectoryName/config/dyngamma.cfg"
    "$archiveMainDirectoryName/config/faq.cfg"
    "$archiveMainDirectoryName/config/favourites.cfg"
    "$archiveMainDirectoryName/config/firstrun.cfg"
    "$archiveMainDirectoryName/config/font.cfg"
    "$archiveMainDirectoryName/config/font_default.cfg"
    "$archiveMainDirectoryName/config/font_monospace.cfg"
    "$archiveMainDirectoryName/config/font_serif.cfg"
    "$archiveMainDirectoryName/config/keymap.cfg"
    "$archiveMainDirectoryName/config/locale.cfg"
    "$archiveMainDirectoryName/config/menus.cfg"
    "$archiveMainDirectoryName/config/menus_bot.cfg"
    "$archiveMainDirectoryName/config/menus_edit.cfg"
    "$archiveMainDirectoryName/config/menus_multiplayer.cfg"
    "$archiveMainDirectoryName/config/menus_settings.cfg"
    "$archiveMainDirectoryName/config/menus_voicecom.cfg"
    "$archiveMainDirectoryName/config/on_quit.cfg"
    "$archiveMainDirectoryName/config/parsestring.cfg"
    "$archiveMainDirectoryName/config/pcksources.cfg"
    "$archiveMainDirectoryName/config/prefabs.cfg"
    "$archiveMainDirectoryName/config/resetbinds.cfg"
    "$archiveMainDirectoryName/config/scontext.cfg"
    "$archiveMainDirectoryName/config/scripts.cfg"
    "$archiveMainDirectoryName/config/securemaps.cfg"
    "$archiveMainDirectoryName/config/sounds.cfg"
    "$archiveMainDirectoryName/config/survival.cfg"

    # Extract the required packages and data files, may be overwritten by a volume
    "$archiveMainDirectoryName/bot"
    "$archiveMainDirectoryName/mods"
    "$archiveMainDirectoryName/packages/audio"
    "$archiveMainDirectoryName/packages/crosshairs"
    "$archiveMainDirectoryName/packages/locale"
    "$archiveMainDirectoryName/packages/maps/official"
    "$archiveMainDirectoryName/packages/maps/preview"
    "$archiveMainDirectoryName/packages/misc"
    "$archiveMainDirectoryName/packages/models"
    "$archiveMainDirectoryName/packages/textures"
    "$archiveMainDirectoryName/scripts"
)

mkdir "$outputDirectory"
tar -xvf "$archiveFilePath" -C "$outputDirectory/" --strip-components=1 "${filesToExtract[@]}"

# Remove the downloaded archive
rm "$archiveFilePath"

# Remove the temporary installed packages
apt-get autoremove -y wget
apt-get autoremove -y bzip2
