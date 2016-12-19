
export PROJECTS=$DOCKERFILES/projects

export TESTS=$DOCKERFILES/tests

export CONFIGURATIONS=$DOCKERFILES/configurations

# TODO: source a dot file here if the user wants to override these exports

export FLATRACK=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/flatrack # HACK: until we move flatrack out of dockerfiles

[[ -n $FLATRACK ]] || {
  echo "Error: FLATRACK environment variable not set.";
  echo "Please set set it to the path of the flatrack scripts directory.";
  exit 5;
}

[[ -n $DOCKERFILES ]] || {
  echo "Error: DOCKERFILES environment variable not set.";
  exit 6;
}

source $FLATRACK/build-helpers.sh
source $FLATRACK/stack-helpers.sh
