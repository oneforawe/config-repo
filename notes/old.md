# Old Notes

The Development notes below came from an older version of the repo README, when
sub-modules were used.  They're no longer used, so it's obsolete.

## Development

Note to self: Don't forget to add submodules manually when installing them for
the first time:  
  `git submodule add https://url/submodule.git path/to/submodule`

Sometimes a submodule package may show up in git-status as "modified" (although
not showing any git-diff) and as "(untracked content)".  I've been able to fix
this situation by removing that whole package (with `rm -r package-name`) and
updating all submodules (with `git submodule update`).  Perhaps there's a better
way, but that works for me.  (Also consider `git submodule update --recursive`
and `git submodule update --init --recursive`.)

If changing something like the submodule url, see instructions such as
[these](https://stackoverflow.com/questions/913701/how-to-change-the-remote-repository-for-a-git-submodule).
