
export FLATRACK="$( dirname "${BASH_SOURCE[0]}" )"/flatrack # HACK: until we move it out of dockerfiles

[[ -n $FLATRACK ]] || {
   echo "Error: flatrack dir not set.";
   echo "Please set your FLATRACK environment variable so the flatrack scripts directory can be found.";
   exit 5;
}

# [[ -n $DOCKERFILES ]] {
#   echo "Error: DOCKERFILES not set.";
#   exit 6;
# }
