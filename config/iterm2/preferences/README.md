# preferences as plist files

plist files are stored/used as binary files and need to be converted to an XML
file in order to be edited, then converted back to a binary plist.

You probably want to first make a copy of the file in question before converting
it, to keep a copy of the file in its original form for reference.

You can convert the plist to XML with the following command:
  plutil -convert xml1 /path/to/com.file.plist

And, convert it back with:
  plutil -convert binary1 /path/to/com.file.plist


# reference files

The reference files are copied from `~/Library/Preferences`, and then
transformed into xml for inspection.  They are kept in case things go wrong and
there's a need to revert the to original functional files.


# top-level file

The top-level file in the `iterm2` folder is an kind of snap-shot/initial
preference/config file that is copied over into the `~Library/Preferences/`
folder when installing the config files (NOT symbolically linked like all/most
of the others, since the Library Preference files cannot be symbolic links) and
so it needs to be manually updated.